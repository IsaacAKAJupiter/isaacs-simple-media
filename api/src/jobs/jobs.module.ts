import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MediaItem } from 'src/media-item/entities/media-item.entity';
import { MediaItemModule } from 'src/media-item/media-item.module';
import { JobsController } from './jobs.controller';
import { JobsService } from './jobs.service';

@Module({
    imports: [TypeOrmModule.forFeature([MediaItem]), MediaItemModule],
    providers: [JobsService],
    controllers: [JobsController],
})
export class JobsModule {}
