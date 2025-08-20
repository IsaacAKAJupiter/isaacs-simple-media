import { BullModule } from '@nestjs/bullmq';
import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { ScheduleModule } from '@nestjs/schedule';
import { TypeOrmModule } from '@nestjs/typeorm';
import * as joi from 'joi';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CategoryModule } from './category/category.module';
import { dataSourceOptions } from './data-source';
import { FileWatcherModule } from './file-watcher/file-watcher.module';
import { JobsModule } from './jobs/jobs.module';
import { MediaItemModule } from './media-item/media-item.module';
import { StaticDocsModule } from './static-docs/static-docs.module';

const envSchema = joi.object({
    NODE_ENV: joi
        .string()
        .valid('development', 'production', 'test', 'provision')
        .default('development'),
    PORT: joi.number().port().default(3333),
    REDIS_HOST: joi.string().default('localhost'),
    REDIS_PORT: joi.number().port().default(6379),
    REDIS_KEY_PREFIX: joi.string().default('bull_ism'),
    UPLOAD_DIRECTORY: joi.string().default('./upload'),
    IMPORT_DIRECTORY: joi.string().default('./import'),
});

@Module({
    imports: [
        ConfigModule.forRoot({
            validationSchema: envSchema,
            isGlobal: true,
            expandVariables: true,
        }),
        TypeOrmModule.forRoot(dataSourceOptions),
        ScheduleModule.forRoot(),
        BullModule.forRootAsync({
            inject: [ConfigService],
            useFactory: async (config: ConfigService) => ({
                prefix: config.get('REDIS_KEY_PREFIX'),
                connection: {
                    host: config.get('REDIS_HOST'),
                    port: config.get('REDIS_PORT'),
                },
            }),
        }),
        StaticDocsModule,
        CategoryModule,
        MediaItemModule,
        FileWatcherModule,
        JobsModule,
    ],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule {}
