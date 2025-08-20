import {
    BadRequestException,
    Injectable,
    NotFoundException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { Queue } from 'bullmq';
import { fileTypeFromBuffer } from 'file-type';
import mime from 'mime';
import { createHash, randomUUID } from 'node:crypto';
import { readFile, rename, stat, unlink } from 'node:fs/promises';
import { basename, extname } from 'node:path';
import { Category } from 'src/category/entities/category.entity';
import { JobsService } from 'src/jobs/jobs.service';
import { IsNull, Not, Repository } from 'typeorm';
import { MediaItem } from './entities/media-item.entity';
import {
    InjectThumbnailQueue,
    InjectTranscodeQueue,
} from './inject-queue.decorator';

@Injectable()
export class MediaItemService {
    constructor(
        @InjectRepository(MediaItem)
        private readonly mediaItemRepository: Repository<MediaItem>,
        @InjectRepository(Category)
        private readonly categoryRepository: Repository<Category>,
        @InjectTranscodeQueue() private readonly transcodeQueue: Queue,
        @InjectThumbnailQueue() private readonly thumbnailQueue: Queue,
        private configService: ConfigService,
        private jobService: JobsService,
    ) {}

    findOne(id: string): Promise<MediaItem | null> {
        return this.mediaItemRepository.findOne({
            where: { id },
            relations: ['categories'],
        });
    }

    async uncategorisedMediaItems(): Promise<MediaItem[]> {
        return this.mediaItemRepository
            .createQueryBuilder('mediaItem')
            .leftJoin('mediaItem.categories', 'category')
            .where('category.id IS NULL')
            .andWhere('mediaItem.recycledAt IS NULL')
            .getMany();
    }

    recycledMediaItems(): Promise<MediaItem[]> {
        return this.mediaItemRepository.findBy({ recycledAt: Not(IsNull()) });
    }

    async remove(id: string) {
        const item = await this.mediaItemRepository.findOneBy({ id });
        if (!item) throw new NotFoundException();

        const filePath = `${item.id}.${item.extension}`;
        await this.mediaItemRepository.remove(item);
        await this.jobService.removeFileAndRemnants(filePath);
    }

    async addToCategory(id: string, categoryID: string) {
        const item = await this.mediaItemRepository.findOne({
            where: { id },
            relations: ['categories'],
        });
        if (!item) throw new NotFoundException('No item.');

        if (item.categories.findIndex((c) => c.id === categoryID) > -1) {
            throw new BadRequestException('Item already in category.');
        }

        const category = await this.categoryRepository.findOneBy({
            id: categoryID,
        });
        if (!category) throw new NotFoundException('No category.');

        item.categories.push(category);
        return this.mediaItemRepository.save(item);
    }

    async removeFromCategory(id: string, categoryID: string) {
        const item = await this.mediaItemRepository.findOne({
            where: { id },
            relations: ['categories'],
        });
        if (!item) throw new NotFoundException('No item.');

        const index = item.categories.findIndex((c) => c.id === categoryID);
        if (index === -1) {
            throw new BadRequestException('Item not in category.');
        }

        item.categories.splice(index, 1);
        return this.mediaItemRepository.save(item);
    }

    async create<
        T extends { path: string; originalname: string; mimetype: string },
    >(options: {
        file: T;
        categoryID?: string;
        deleteOnFail: boolean;
    }): Promise<
        | {
              result: 'success';
              mediaItem: MediaItem;
          }
        | { result: 'duplicate' }
        | { result: 'unsupported' }
        | { result: 'error'; message: string }
    > {
        try {
            const fileBuffer = await readFile(options.file.path);
            const fileType = await fileTypeFromBuffer(fileBuffer);
            if (!fileType || !/^(image|video)/.test(fileType.mime)) {
                if (options.deleteOnFail) await unlink(options.file.path);
                return { result: 'unsupported' };
            }

            const hash = createHash('sha256').update(fileBuffer).digest('hex');
            const existingItem = await this.mediaItemRepository.findOneBy({
                contentHash: hash,
            });
            if (existingItem) {
                if (options.deleteOnFail) await unlink(options.file.path);
                return { result: 'duplicate' };
            }

            let size = 0;
            try {
                size = Math.round((await stat(options.file.path)).size);
            } catch (e) {
                if (options.deleteOnFail) await unlink(options.file.path);
                return {
                    result: 'error',
                    message: 'Unable to find size of file.',
                };
            }

            const extension = (
                mime.getExtension(options.file.mimetype) ??
                extname(options.file.path)
            ).replace(/\./g, '');

            const uuid = randomUUID();
            const newPath = `${this.configService.get('UPLOAD_DIRECTORY')}/${uuid}.${extension}`;
            try {
                await rename(options.file.path, newPath);
            } catch (e) {
                if (options.deleteOnFail) await unlink(options.file.path);
                return {
                    result: 'error',
                    message: 'Unable to find size of file.',
                };
            }

            const newMediaItem = this.mediaItemRepository.create({
                id: uuid,
                fileName: options.file.originalname,
                contentHash: hash,
                mediaType: options.file.mimetype,
                extension,
                size,
            });
            const savedItem = await this.mediaItemRepository.save(newMediaItem);

            if (options.categoryID) {
                const category = await this.categoryRepository.findOne({
                    where: { id: options.categoryID },
                    relations: ['mediaItems'],
                });
                if (!category) {
                    if (options.deleteOnFail) await unlink(newPath);
                    await this.mediaItemRepository.delete(savedItem.id);
                    return {
                        result: 'error',
                        message: 'Failed to attach to category.',
                    };
                }

                category.mediaItems.push(savedItem);
                await this.categoryRepository.save(category);
            }

            if (
                savedItem.mediaType.startsWith('video/') ||
                savedItem.mediaType === 'image/gif'
            ) {
                await this.thumbnailQueue.add('thumbnail', savedItem);
            }

            if (savedItem.mediaType.startsWith('video/')) {
                await this.transcodeQueue.add('transcode', savedItem);
            }

            return {
                result: 'success',
                mediaItem: savedItem,
            };
        } catch (e) {
            return { result: 'error', message: e.message };
        }
    }

    async recycle(id: string): Promise<MediaItem> {
        const mediaItem = await this.mediaItemRepository.findOneBy({ id });

        if (!mediaItem) {
            throw new NotFoundException(`MediaItem with ID "${id}" not found`);
        }

        mediaItem.recycledAt = new Date();
        return this.mediaItemRepository.save(mediaItem);
    }

    async unRecycle(id: string): Promise<MediaItem> {
        const mediaItem = await this.mediaItemRepository.findOneBy({ id });
        if (!mediaItem) {
            throw new NotFoundException(`MediaItem with ID "${id}" not found`);
        }

        mediaItem.recycledAt = null;
        return this.mediaItemRepository.save(mediaItem);
    }

    async createFromFilePath(filePath: string) {
        return this.create({
            file: {
                path: filePath,
                originalname: basename(filePath),
                mimetype: mime.getType(filePath) || 'application/octet-stream',
            },
            deleteOnFail: false,
        });
    }
}
