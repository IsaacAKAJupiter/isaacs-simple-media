import { Processor } from '@nestjs/bullmq';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Job } from 'bullmq';
import { mkdir } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { WorkerHostProcessor } from '../worker-host.process';

@Injectable()
@Processor('transcode')
export class TranscodeProcessor extends WorkerHostProcessor {
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
            'hls',
            item.id,
            'stream.m3u8',
        );
        await mkdir(dirname(outputPath), { recursive: true });

        try {
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
                outputPath,
            ];
            await this.runSpawnCommand(command, args);
            return true;
        } catch (error) {
            throw new InternalServerErrorException(error);
            // TODO: Handle the error, maybe update the DB record to a 'failed' state.
        }
    }
}
