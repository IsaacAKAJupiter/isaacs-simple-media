import { Processor } from '@nestjs/bullmq';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { Job } from 'bullmq';
import { mkdir, unlink } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { MediaItem } from 'src/media-item/entities/media-item.entity';
import { Repository } from 'typeorm';
import { WorkerHostProcessor } from '../worker-host.process';

@Injectable()
@Processor('transcode')
export class TranscodeProcessor extends WorkerHostProcessor {
    constructor(
        private configService: ConfigService,
        @InjectRepository(MediaItem)
        private readonly mediaItemRepository: Repository<MediaItem>,
    ) {
        super();
    }

    async process(job: Job, _token?: string): Promise<any> {
        const item = job.data as MediaItem;
        const uploadDir = this.configService.get<string>('UPLOAD_DIRECTORY')!;

        let inputPath = join(uploadDir, `${item.id}.${item.extension}`);

        try {
            if (item.mediaType === 'image/gif') {
                const mp4OutputPath = join(uploadDir, `${item.id}.mp4`);
                const command = 'ffmpeg';

                const args = [
                    '-i',
                    inputPath,
                    '-movflags',
                    'faststart',
                    '-pix_fmt',
                    'yuv420p',
                    '-vf',
                    'scale=trunc(iw/2)*2:trunc(ih/2)*2',
                    mp4OutputPath,
                ];

                await this.runSpawnCommand(command, args);

                await this.mediaItemRepository.update(item.id, {
                    mediaType: 'video/mp4',
                    extension: 'mp4',
                });

                await unlink(inputPath).catch(() => null);

                inputPath = mp4OutputPath;
            }

            const hlsOutputPath = join(
                uploadDir,
                'hls',
                item.id,
                'stream.m3u8',
            );
            await mkdir(dirname(hlsOutputPath), { recursive: true });

            const command = 'ffmpeg';
            const args = [
                '-i',
                inputPath,
                '-codec:v',
                'copy',
                '-codec:a',
                'copy',
                '-hls_time',
                '10',
                '-hls_list_size',
                '0',
                '-f',
                'hls',
                hlsOutputPath,
            ];

            await this.runSpawnCommand(command, args);

            return true;
        } catch (error) {
            throw new InternalServerErrorException(
                error instanceof Error ? error.message : String(error),
            );
        }
    }
}
