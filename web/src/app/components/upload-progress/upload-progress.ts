import { AsyncPipe, NgClass } from '@angular/common';
import { Component, inject, OnInit } from '@angular/core';
import { BehaviorSubject, combineLatest, map, Observable } from 'rxjs';
import { Upload, UploadService } from '../../services/upload';

@Component({
  selector: 'app-upload-progress',
  imports: [AsyncPipe, NgClass],
  templateUrl: './upload-progress.html',
  styleUrl: './upload-progress.css',
})
export class UploadProgress implements OnInit {
  private readonly uploadService = inject(UploadService);

  uploads$: Observable<Upload[]>;
  filteredUploads$: Observable<Upload[]>;
  counts$: Observable<Record<Upload['status'], number>>;
  finishedCount$: Observable<number>;

  tabs: { id: Upload['status']; label: string }[] = [
    { id: 'uploading', label: 'Uploading' },
    { id: 'queued', label: 'Queued' },
    { id: 'success', label: 'Completed' },
    { id: 'error', label: 'Errors' },
    { id: 'duplicate', label: 'Duplicates' },
  ];

  activeTab$ = new BehaviorSubject<Upload['status']>('uploading');

  constructor() {
    this.uploads$ = this.uploadService.uploads$;

    this.counts$ = this.uploads$.pipe(
      map((uploads) => {
        const counts: Record<Upload['status'], number> = {
          uploading: 0,
          queued: 0,
          success: 0,
          error: 0,
          duplicate: 0,
        };
        for (const upload of uploads) {
          if (counts[upload.status] !== undefined) {
            counts[upload.status]++;
          }
        }
        return counts;
      }),
    );

    this.finishedCount$ = this.counts$.pipe(
      map((counts) => counts.success + counts.error + counts.duplicate),
    );

    this.filteredUploads$ = combineLatest([this.uploads$, this.activeTab$]).pipe(
      map(([uploads, activeTab]) => uploads.filter((u) => u.status === activeTab)),
    );
  }

  ngOnInit(): void {
    this.counts$.subscribe((counts) => {
      if (counts.uploading === 0 && this.activeTab$.value === 'uploading') {
        const nextTab = this.tabs.find((tab) => counts[tab.id] > 0);
        if (nextTab) {
          this.activeTab$.next(nextTab.id);
        }
      }
    });
  }

  selectTab(tab: Upload['status']): void {
    this.activeTab$.next(tab);
  }

  clearFinished(): void {
    this.uploadService.clearFinished();
  }

  getProgressBarClass(status: Upload['status']): string {
    switch (status) {
      case 'success':
        return 'bg-green-500';
      case 'error':
        return 'bg-red-500';
      case 'duplicate':
        return 'bg-orange-500';
      case 'queued':
        return 'bg-gray-500';
      default:
        return 'bg-blue-600';
    }
  }

  cancelUpload(id: string): void {
    this.uploadService.removeUpload(id);
  }
}
