import { Processor } from '@nestjs/bullmq';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Job } from 'bullmq';
import { mkdir } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { WorkerHostProcessor } from '../worker-host.process';

@Injectable()
@Processor('thumbnail')
export class ThumbnailProcessor extends WorkerHostProcessor {
    constructor(private configService: ConfigService) {
        super();
    }

    async process(job: Job, _token?: string): Promise<any> {
        const item = job.data;
        const inputPath = join(
            this.configService.get('UPLOAD_DIRECTORY')!,
            `${item.id}.${item.extension}`,
        );
        const outputPath = join(
            this.configService.get('UPLOAD_DIRECTORY')!,
            'thumbnails',
            `${item.id}.png`,
        );
        await mkdir(dirname(outputPath), { recursive: true });

        try {
            const command = 'ffmpeg';
            const args = [
                '-i',
                inputPath,
                '-update',
                'true',
                '-frames:v',
                '1',
                '-q:v',
                '2',
                '-vf',
                'thumbnail,scale=300:300:force_original_aspect_ratio=increase',
                outputPath,
            ];
            await this.runSpawnCommand(command, args);
            return true;
        } catch (error) {
            throw new InternalServerErrorException(error.message);
            // TODO: Handle the error, maybe update the DB record to a 'failed' state.
        }
    }
}
