import { Controller, HttpCode, HttpStatus, Post } from '@nestjs/common';
import { ApiAcceptedResponse, ApiOperation, ApiTags } from '@nestjs/swagger';
import { JobsService } from './jobs.service';

ApiTags('Jobs');
@Controller('jobs')
export class JobsController {
    constructor(private readonly jobsService: JobsService) {}

    @Post('cleanup-orphans')
    @HttpCode(HttpStatus.ACCEPTED)
    @ApiOperation({
        summary:
            'Manually trigger a scan to find and remove orphaned media records.',
        description:
            'This is an asynchronous task that runs in the background.',
    })
    @ApiAcceptedResponse({
        description: 'The cleanup job has been successfully started.',
    })
    triggerOrphanCleanup() {
        this.jobsService.cleanupOrphanedMediaItems();

        return { message: 'Orphaned media cleanup job started.' };
    }

    @Post('cleanup-orphan-files')
    @HttpCode(HttpStatus.ACCEPTED)
    @ApiOperation({
        summary:
            'Manually trigger a scan to find and remove orphaned files without media records.',
        description:
            'This is an asynchronous task that runs in the background.',
    })
    @ApiAcceptedResponse({
        description: 'The cleanup job has been successfully started.',
    })
    triggerOrphanFileCleanup() {
        this.jobsService.cleanupOrphanedFiles();

        return { message: 'Orphaned file cleanup job started.' };
    }
}
