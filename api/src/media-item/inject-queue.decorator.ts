import { InjectQueue } from '@nestjs/bullmq';

export const InjectTranscodeQueue = () => InjectQueue('transcode');
export const InjectThumbnailQueue = () => InjectQueue('thumbnail');
