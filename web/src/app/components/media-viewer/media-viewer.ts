import { isPlatformBrowser } from '@angular/common';
import {
  Component,
  computed,
  effect,
  ElementRef,
  inject,
  input,
  OnDestroy,
  OnInit,
  output,
  PLATFORM_ID,
  signal,
  viewChild,
} from '@angular/core';
import HLS from 'hls.js';
import { MediaItemDto } from '../../../../typescript-axios';
import { ConfigService } from '../../services/config';

@Component({
  selector: 'app-media-viewer',
  imports: [],
  templateUrl: './media-viewer.html',
  styleUrl: './media-viewer.css',
})
export class MediaViewer implements OnInit, OnDestroy {
  private readonly configService = inject(ConfigService);
  private readonly platformID = inject(PLATFORM_ID);

  private player = signal<HLS | null>(null);

  readonly isImage = computed(() => this.mediaItem().mediaType.startsWith('image/'));
  readonly isVideo = computed(() => this.mediaItem().mediaType.startsWith('video/'));
  readonly mediaURL = computed(() => {
    const mediaItem = this.mediaItem();
    return `${this.configService.getBaseURL()}/static/${mediaItem.id}.${mediaItem.extension}`;
  });
  readonly hlsURL = computed(() => {
    const mediaItem = this.mediaItem();
    return `${this.configService.getBaseURL()}/static/hls/${mediaItem.id}/stream.m3u8`;
  });

  readonly mediaItem = input.required<MediaItemDto>();
  readonly close = output<void>();

  readonly videoPlayer = viewChild<ElementRef<HTMLVideoElement>>('videoPlayer');

  constructor() {
    effect(() => {
      const videoPlayer = this.videoPlayer();
      if (videoPlayer) {
        this.initialisePlayer();
      } else {
        this.disposePlayer();
      }
    });
  }

  ngOnInit() {
    if (!isPlatformBrowser(this.platformID)) return;

    document.body.classList.add('overflow-hidden');
  }

  ngOnDestroy() {
    if (!isPlatformBrowser(this.platformID)) return;

    document.body.classList.remove('overflow-hidden');

    this.disposePlayer();
  }

  closeViewer(): void {
    this.disposePlayer();
    this.close.emit();
  }

  private initialisePlayer(): void {
    if (this.player()) return;

    const videoPlayer = this.videoPlayer();
    if (!videoPlayer?.nativeElement) return;

    this.disposePlayer();

    if (HLS.isSupported()) {
      const hls = new HLS();
      hls.loadSource(this.hlsURL());
      hls.attachMedia(videoPlayer.nativeElement);
      this.player.set(hls);
    } else if (videoPlayer.nativeElement.canPlayType('application/vnd.apple.mpegurl')) {
      videoPlayer.nativeElement.src = this.hlsURL();
    }
  }

  private disposePlayer(): void {
    const player = this.player();
    if (!player) return;

    player.detachMedia();
    this.player.set(null);
  }
}
