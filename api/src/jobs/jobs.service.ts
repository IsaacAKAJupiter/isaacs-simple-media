import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Cron, CronExpression } from '@nestjs/schedule';
import { InjectRepository } from '@nestjs/typeorm';
import { access, readdir, rm, unlink } from 'node:fs/promises';
import { join } from 'node:path';
import { MediaItem } from 'src/media-item/entities/media-item.entity';
import { In, Repository } from 'typeorm';

@Injectable()
export class JobsService {
    private readonly logger = new Logger(JobsService.name);

    constructor(
        @InjectRepository(MediaItem)
        private readonly mediaItemRepository: Repository<MediaItem>,
        private configService: ConfigService,
    ) {}

    @Cron(CronExpression.EVERY_DAY_AT_7AM)
    async handleScheduledOrphanCleanup() {
        this.logger.log('Running scheduled scan for orphaned media items...');
        await this.cleanupOrphanedMediaItems();
    }

    @Cron(CronExpression.EVERY_DAY_AT_8AM)
    async handleScheduledOrphanFileCleanup() {
        this.logger.log('Running scheduled scan for orphaned files...');
        await this.cleanupOrphanedFiles();
    }

    /**
     * Scans the database for media items whose files no longer exist on disk
     * and removed the orphaned records.
     */
    async cleanupOrphanedMediaItems(): Promise<{ count: number }> {
        this.logger.log('Starting scan for orphaned media items.');

        const allItems = await this.mediaItemRepository.find({
            select: ['id', 'extension'],
        });
        if (allItems.length < 1) {
            this.logger.log('No media items in the database to scan.');
            return { count: 0 };
        }

        const orphanedIDs: string[] = [];
        for (const item of allItems) {
            const exists = await this.accessFileOrDir(
                join(
                    this.configService.get('UPLOAD_DIRECTORY')!,
                    `${item.id}.${item.extension}`,
                ),
            );
            if (!exists) {
                this.logger.warn(`Orphan detected: ${item.id}`);
                orphanedIDs.push(item.id);
            }
        }

        if (orphanedIDs.length < 1) {
            this.logger.log(`No orphaned records found.`);
            return { count: 0 };
        }

        this.logger.log(
            `Found ${orphanedIDs.length} orphaned records. Deleting...`,
        );
        await this.mediaItemRepository.delete({ id: In(orphanedIDs) });
        this.logger.log(`Orphaned records deleted successfully.`);
        return { count: orphanedIDs.length };
    }

    /**
     * Scans the files for items that no longer exist in the media items database
     * and removed the orphaned files/remnants (HLS/thumbnails/etc).
     */
    async cleanupOrphanedFiles(): Promise<{ count: number }> {
        this.logger.log('Starting scan for orphaned files on disk.');
        const storagePath = this.configService.get('UPLOAD_DIRECTORY')!;

        const allItems = await this.mediaItemRepository.find({
            select: ['id', 'extension'],
        });
        const knownPaths = new Set(
            allItems.map((i) => `${i.id}.${i.extension}`),
        );

        const itemInUploadDirectory = await readdir(storagePath, {
            withFileTypes: true,
        });
        const orphanedFiles: string[] = [];
        for (const item of itemInUploadDirectory) {
            if (item.isDirectory()) continue;

            if (!knownPaths.has(item.name)) {
                orphanedFiles.push(item.name);
            }
        }

        if (orphanedFiles.length < 1) {
            this.logger.log('No orphaned files found.');
            return { count: 0 };
        }

        this.logger.warn(
            `Found ${orphanedFiles.length} orphaned files to delete.`,
        );
        for (const filePath of orphanedFiles) {
            await this.removeFileAndRemnants(filePath);
        }

        return { count: orphanedFiles.length };
    }

    async removeFileAndRemnants(filePath: string) {
        try {
            await unlink(
                join(this.configService.get('UPLOAD_DIRECTORY')!, filePath),
            );
            this.logger.log(`Deleted orphan: ${filePath}`);

            const id = filePath.split('.')[0];

            this.logger.log(`Checking for thumbnail for: ${filePath}`);
            const thumbnailPath = join(
                this.configService.get('UPLOAD_DIRECTORY')!,
                'thumbnails',
                `${id}.png`,
            );
            const thumbnailExists = await this.accessFileOrDir(thumbnailPath);
            if (thumbnailExists) {
                await unlink(thumbnailPath);
                this.logger.log(`Deleted orphan thumbnail: ${thumbnailPath}`);
            }

            this.logger.log(`Checking for HLS directory for: ${filePath}`);
            const hlsDirectory = join(
                this.configService.get('UPLOAD_DIRECTORY')!,
                'hls',
                id,
            );
            const hlsExists = await this.accessFileOrDir(hlsDirectory);
            if (hlsExists) {
                await rm(hlsDirectory, { recursive: true, force: true });
                this.logger.log(
                    `Deleted orphan HLS directory: ${hlsDirectory}`,
                );
            }
        } catch (e) {
            this.logger.log(`Failed to delete orphan ${filePath}:`, e);
        }
    }

    private async accessFileOrDir(path: string) {
        try {
            await access(path);
            return true;
        } catch (_) {
            return false;
        }
    }
}
