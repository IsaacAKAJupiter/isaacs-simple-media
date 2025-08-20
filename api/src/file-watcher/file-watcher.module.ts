import { Module } from '@nestjs/common';
import { MediaItemModule } from 'src/media-item/media-item.module';
import { FileWatcherService } from './file-watcher.service';

@Module({
    imports: [MediaItemModule],
    providers: [FileWatcherService],
})
export class FileWatcherModule {}
