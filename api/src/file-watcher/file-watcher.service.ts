import { Injectable, Logger, OnModuleInit } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import chokidar from 'chokidar';
import { unlink } from 'node:fs/promises';
import path from 'node:path';
import { MediaItemService } from 'src/media-item/media-item.service';

@Injectable()
export class FileWatcherService implements OnModuleInit {
    private readonly logger = new Logger(FileWatcherService.name);

    constructor(
        private readonly mediaItemService: MediaItemService,
        private configService: ConfigService,
    ) {}

    onModuleInit() {
        this.logger.log('File watcher service started.');
        this.startWatching();
    }

    private startWatching() {
        const watchPath = this.configService.get('IMPORT_DIRECTORY');
        this.logger.log(
            `Watching for new files in ${path.resolve(watchPath)}.`,
        );

        try {
            const watcher = chokidar.watch(watchPath, {
                ignored: /^\./,
                persistent: true,
                awaitWriteFinish: {
                    stabilityThreshold: 2000,
                    pollInterval: 100,
                },
            });

            watcher.on('add', async (filePath) => {
                this.logger.log(
                    `New file detected: ${filePath}. Processing...`,
                );
                try {
                    const result =
                        await this.mediaItemService.createFromFilePath(
                            filePath,
                        );
                    switch (result.result) {
                        case 'success':
                            this.logger.log(
                                `Successfully processed and added: ${result.mediaItem.fileName}`,
                            );
                            break;
                        case 'duplicate':
                            this.logger.error(
                                `Duplicate file found: ${filePath}. Removing...`,
                            );
                            await unlink(filePath);
                            break;
                        case 'error':
                            this.logger.error(
                                `Failed processing file with error: ${result.message}`,
                            );
                            break;
                    }
                } catch (e) {
                    this.logger.error(
                        `Failed to process file ${filePath}: ${e.message}`,
                    );
                }
            });
        } catch (e) {
            this.logger.error(`Error starting watcher: ${e.message}`);
        }
    }
}
