import { inject, Injectable } from '@angular/core';
import { AxiosRequestConfig } from 'axios';
import { BehaviorSubject, Subject } from 'rxjs';
import { MediaItemApi, MediaItemDto } from '../../../typescript-axios';
import { ConfigService } from './config';

export interface Upload {
  id: string;
  file: File;
  progress: number;
  status: 'queued' | 'uploading' | 'success' | 'duplicate' | 'error';
  categoryID?: string;
  error?: string;
  abortController: AbortController;
}

@Injectable({
  providedIn: 'root',
})
export class UploadService {
  private readonly configService = inject(ConfigService);
  private readonly mediaItemApi = new MediaItemApi(undefined, this.configService.getBaseURL());

  private uploads: Map<string, Upload> = new Map();
  private uploadQueue: Upload[] = [];
  private activeUploads = 0;
  private readonly maxConcurrentUploads = 5;

  public uploads$: BehaviorSubject<Upload[]> = new BehaviorSubject<Upload[]>([]);
  public uploadSuccess$ = new Subject<MediaItemDto>();

  constructor() {}

  public upload(files: File[], categoryID?: string): void {
    files.forEach((file) => {
      const id = `${file.name}-${file.size}-${Date.now()}`;
      const upload: Upload = {
        id,
        file,
        progress: 0,
        status: 'queued',
        categoryID,
        abortController: new AbortController(),
      };
      this.uploads.set(id, upload);
      this.uploadQueue.push(upload);
    });
    this.notify();
    this.processQueue();
  }

  private processQueue(): void {
    while (this.activeUploads < this.maxConcurrentUploads && this.uploadQueue.length > 0) {
      const uploadToProcess = this.uploadQueue.shift();
      if (uploadToProcess) {
        this.activeUploads++;
        this.performUpload(uploadToProcess);
      }
    }
  }

  private performUpload(upload: Upload): void {
    this.updateUpload(upload.id, { status: 'uploading' });

    const axiosConfig: AxiosRequestConfig = {
      onUploadProgress: (progressEvent) => {
        const progress = Math.round((100 * progressEvent.loaded) / (progressEvent.total || 1));
        this.updateUpload(upload.id, { progress });
      },
      signal: upload.abortController.signal,
    };

    this.mediaItemApi
      .uploadFile(upload.file, upload.categoryID || undefined, axiosConfig)
      .then((response) => {
        if (response.status >= 200 && response.status < 300) {
          this.updateUpload(upload.id, { progress: 100, status: 'success' });
          this.uploadSuccess$.next(response.data);
        } else {
          this.updateUpload(upload.id, {
            progress: 100,
            status: 'error',
            error: `Server responded with status: ${response.status}`,
          });
        }
      })
      .catch((error) => {
        let status: 'duplicate' | 'error' = 'error';
        let errorMsg = 'An unknown error occurred.';
        if (error.response?.status === 409) {
          status = 'duplicate';
          errorMsg = 'This file is a duplicate.';
        } else {
          errorMsg = `Error: ${error.message || 'Connection failed'}`;
        }
        this.updateUpload(upload.id, { progress: 100, status, error: errorMsg });
      })
      .finally(() => {
        this.activeUploads--;
        this.processQueue();
      });
  }

  private updateUpload(id: string, changes: Partial<Upload>): void {
    const upload = this.uploads.get(id);
    if (upload) {
      Object.assign(upload, changes);
      this.notify();
    }
  }

  public removeUpload(id: string): void {
    const upload = this.uploads.get(id);
    if (!upload) return;

    if (upload.status === 'uploading' || upload.status === 'queued') {
      upload.abortController.abort();
    }

    const queueIndex = this.uploadQueue.findIndex((u) => u.id === id);
    if (queueIndex > -1) this.uploadQueue.splice(queueIndex, 1);
    this.uploads.delete(id);
    this.notify();
  }

  public clearFinished(): void {
    const finishedUploads = Array.from(this.uploads.values()).filter(
      (u) => u.status === 'success' || u.status === 'error' || u.status === 'duplicate',
    );
    finishedUploads.forEach((u) => this.uploads.delete(u.id));
    this.notify();
  }

  private notify(): void {
    this.uploads$.next(Array.from(this.uploads.values()));
  }
}
