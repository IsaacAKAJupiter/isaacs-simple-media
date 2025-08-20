import { OnWorkerEvent, WorkerHost } from '@nestjs/bullmq';
import { Logger } from '@nestjs/common';
import { Job } from 'bullmq';
import { spawn } from 'node:child_process';

export abstract class WorkerHostProcessor extends WorkerHost {
    protected readonly logger = new Logger(WorkerHostProcessor.name);

    @OnWorkerEvent('completed')
    onCompleted(job: Job) {
        const { id, name, queueName, finishedOn, returnvalue } = job;
        const completionTime = finishedOn
            ? new Date(finishedOn).toISOString()
            : '';
        this.logger.log(
            `Job id: ${id}, name: ${name} completed in queue ${queueName} on ${completionTime}. Result: ${returnvalue}`,
        );
    }

    @OnWorkerEvent('progress')
    onProgress(job: Job) {
        const { id, name, progress } = job;
        this.logger.log(`Job id: ${id}, name: ${name} completes ${progress}%`);
    }

    @OnWorkerEvent('failed')
    onFailed(job: Job) {
        const { id, name, queueName, failedReason } = job;
        this.logger.error(
            `Job id: ${id}, name: ${name} failed in queue ${queueName}. Failed reason: ${failedReason}`,
        );
    }

    @OnWorkerEvent('active')
    onActive(job: Job) {
        const { id, name, queueName, timestamp } = job;
        const startTime = timestamp ? new Date(timestamp).toISOString() : '';
        this.logger.log(
            `Job id: ${id}, name: ${name} starts in queue ${queueName} on ${startTime}.`,
        );
    }

    runSpawnCommand(
        command: string,
        args: string[],
        options?: { logStdOut?: boolean; logStdErr?: boolean },
    ): Promise<void> {
        return new Promise((resolve, reject) => {
            const process = spawn(command, args);

            if (options?.logStdOut) {
                process.stdout.on('data', (data) => {
                    this.logger.verbose(`[STDOUT] ${data.toString()}`);
                });
            }

            if (options?.logStdErr) {
                process.stderr.on('data', (data) => {
                    this.logger.verbose(`[STDERR] ${data.toString()}`);
                });
            }

            process.on('close', (code) => {
                if (code === 0) {
                    resolve();
                } else {
                    reject(new Error(`Process exited with code ${code}`));
                }
            });

            process.on('error', (err) => {
                reject(err);
            });
        });
    }
}
