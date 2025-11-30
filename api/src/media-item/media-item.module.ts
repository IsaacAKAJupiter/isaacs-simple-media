import { Module } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { MulterModule } from '@nestjs/platform-express';
import { TypeOrmModule } from '@nestjs/typeorm';
import { diskStorage } from 'multer';
import { randomUUID } from 'node:crypto';
import { extname } from 'node:path';
import { CategoryTag } from 'src/category-tag/entities/category-tag.entity';
import { CategoryService } from 'src/category/category.service';
import { Category } from 'src/category/entities/category.entity';
import { JobsService } from 'src/jobs/jobs.service';
import { QueueModule } from 'src/queues/queues.module';
import { ThumbnailProcessor } from 'src/queues/thumbnail/thumbnail.processor';
import { TranscodeProcessor } from 'src/queues/transcode/transcode.processor';
import { MediaItem } from './entities/media-item.entity';
import { MediaItemController } from './media-item.controller';
import { MediaItemService } from './media-item.service';

@Module({
    imports: [
        TypeOrmModule.forFeature([MediaItem, Category, CategoryTag]),
        MulterModule.registerAsync({
            inject: [ConfigService],
            useFactory: async (config: ConfigService) => ({
                storage: diskStorage({
                    destination: config.get('UPLOAD_DIRECTORY'),
                    filename: (_req, file, callback) => {
                        const extension = extname(file.originalname);
                        callback(null, `${randomUUID()}${extension}`);
                    },
                }),
            }),
        }),
        QueueModule.register({
            queues: ['transcode', 'thumbnail'],
        }),
    ],
    controllers: [MediaItemController],
    providers: [
        MediaItemService,
        CategoryService,
        JobsService,
        TranscodeProcessor,
        ThumbnailProcessor,
    ],
    exports: [MediaItemService],
})
export class MediaItemModule {}
