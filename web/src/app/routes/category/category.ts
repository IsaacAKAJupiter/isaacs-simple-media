import {
  afterNextRender,
  Component,
  effect,
  ElementRef,
  inject,
  OnDestroy,
  signal,
  viewChild,
} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { AxiosResponse } from 'axios';
import type ImagesLoaded from 'imagesloaded';
import type Masonry from 'masonry-layout';
import { Subscription } from 'rxjs';
import {
  CategoriesApi,
  CategoryDto,
  MediaItemApi,
  MediaItemDto,
} from '../../../../typescript-axios';
import { FileUpload } from '../../components/file-upload/file-upload';
import { MediaViewer } from '../../components/media-viewer/media-viewer';
import { ConfigService } from '../../services/config';
import { UploadService } from '../../services/upload';

@Component({
  selector: 'app-category',
  imports: [RouterLink, FileUpload, MediaViewer, FormsModule],
  templateUrl: './category.html',
  styleUrl: './category.css',
})
export class Category implements OnDestroy {
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly configService = inject(ConfigService);
  private readonly uploadService = inject(UploadService);

  private masonryLib?: typeof Masonry;
  private imagesOnlyLib?: typeof ImagesLoaded;

  categoryID = signal<string | null>(null);
  category = signal<CategoryDto | null>(null);
  mediaItems = signal<MediaItemDto[] | null>(null);
  selectedMediaItem = signal<MediaItemDto | null>(null);
  checkedMediaItems = signal<Set<string>>(new Set());
  otherCategories = signal<CategoryDto[]>([]);
  otherCategorySelected = signal<string | null>(null);
  private uploadSuccessSubscription?: Subscription;
  private masonry?: Masonry;
  private imagesLoadedCB = this._imagesLoadedCB.bind(this);

  private mediaItemApi?: MediaItemApi;
  private categoriesApi?: CategoriesApi;

  private masonryDiv = viewChild<ElementRef<HTMLDivElement>>('masonryDiv');

  constructor() {
    afterNextRender(async () => {
      if (!this.configService.isProvisioned()) {
        this.router.navigate(['/']);
      }

      this.mediaItemApi = new MediaItemApi(undefined, this.configService.getBaseURL());
      this.categoriesApi = new CategoriesApi(undefined, this.configService.getBaseURL());

      this.categoryID.set(this.route.snapshot.paramMap.get('id'));
      this.loadMedia();
      this.loadCategories();

      if (this.categoryID()) {
        this.loadCategoryDetails();
      }

      this.uploadSuccessSubscription = this.uploadService.uploadSuccess$.subscribe((mediaItem) => {
        this.mediaItems.update((i) => [...(i ?? []), mediaItem]);
      });

      this.masonryLib = (await import('masonry-layout')).default;
      this.imagesOnlyLib = (await import('imagesloaded')).default;
      this.initMasonry();
    });

    effect(() => {
      this.mediaItems();
      this.initMasonry();
    });
  }

  ngOnDestroy(): void {
    this.uploadSuccessSubscription?.unsubscribe();
    this.destroyMasonry();
  }

  isVideo(item: MediaItemDto) {
    return item.mediaType.startsWith('video/');
  }

  isGIF(item: MediaItemDto) {
    return item.mediaType === 'image/gif';
  }

  mediaImgSrc(item: MediaItemDto) {
    if (this.isVideo(item) || this.isGIF(item)) {
      return `${this.configService.getBaseURL()}/static/thumbnails/${item.id}.png`;
    }

    return `${this.configService.getBaseURL()}/static/${item.id}.${item.extension}`;
  }

  async loadMedia() {
    if (!this.categoriesApi || !this.mediaItemApi) return;

    const categoryID = this.categoryID();
    if (categoryID) {
      const response = await this.categoriesApi.findOne(categoryID);
      this.mediaItems.set(response.data.mediaItems ?? []);
    } else {
      const response = await this.mediaItemApi.uncategorisedMediaItems();
      this.mediaItems.set(response.data);
    }
  }

  async loadCategoryDetails() {
    const categoryID = this.categoryID();
    if (!categoryID || !this.categoriesApi) return;

    const response = await this.categoriesApi.findOne(categoryID);
    this.category.set(response.data);
  }

  async loadCategories() {
    if (!this.categoriesApi) return;

    const categoryID = this.categoryID();
    const response = await this.categoriesApi.findAll();
    this.otherCategories.set(
      categoryID ? response.data.filter((c) => c.id !== categoryID) : response.data,
    );
  }

  async deleteMedia() {
    if (!this.mediaItemApi) return;

    const items = this.checkedMediaItems();
    if (items.size < 1) return;

    if (!confirm('Are you sure you want to delete these media items?')) return;

    const deleteResults = await Promise.allSettled(
      Array.from(items).map(async (i) => ({
        id: i,
        result: await this.mediaItemApi!.deleteItem(i),
      })),
    );
    const successIDs = new Set(
      deleteResults
        .filter(
          (
            i,
          ): i is PromiseFulfilledResult<{
            id: string;
            result: AxiosResponse<void, any>;
          }> => i.status === 'fulfilled' && i.value.result.status === 200,
        )
        .map((i) => i.value.id),
    );
    const failedAmount = deleteResults.length - successIDs.size;
    if (failedAmount > 0) {
      alert(`Failed deleting ${failedAmount} items.`);
    }

    this.mediaItems.update((i) => (i ?? []).filter((mi) => !successIDs.has(mi.id)));
    this.checkedMediaItems.set(new Set());
  }

  async setAsThumbnail() {
    if (!this.categoriesApi) return;

    const items = Array.from(this.checkedMediaItems());
    const category = this.category();
    if (items.length !== 1 || !category) return;

    const item = (this.mediaItems() ?? []).find((i) => i.id === items[0]);
    if (!item) return;

    const result = await this.categoriesApi.update(category.id, { thumbnail: item });
    if (result.status !== 200) {
      alert(`Failed changing category thumbnail.`);
      return;
    }

    this.category.update((c) => (c ? { ...c, thumbnail: item } : null));
    this.checkedMediaItems.set(new Set());
  }

  async moveCategory() {
    if (!this.mediaItemApi) return;

    const items = this.checkedMediaItems();
    const selectedCategory = this.otherCategorySelected();
    if (items.size < 1 || !selectedCategory) return;

    const categoryID = this.categoryID();
    const results = await Promise.allSettled(
      Array.from(items).map(async (i) => {
        if (categoryID) {
          const removeResponse = await this.mediaItemApi!.removeMediaItemFromCategory(i, {
            categoryID,
          });
          if (removeResponse.status !== 200) throw new Error();
        }

        if (selectedCategory !== 'remove') {
          const addResponse = await this.mediaItemApi!.addMediaItemToCategory(i, {
            categoryID: selectedCategory,
          });
          if (addResponse.status !== 200) throw new Error();
        }

        return {
          id: i,
        };
      }),
    );
    const successIDs = new Set(
      results
        .filter(
          (
            i,
          ): i is PromiseFulfilledResult<{
            id: string;
          }> => i.status === 'fulfilled',
        )
        .map((i) => i.value.id),
    );
    const failedAmount = results.length - successIDs.size;
    if (failedAmount > 0) {
      alert(`Failed changing category for ${failedAmount} items.`);
    }

    this.mediaItems.update((i) => (i ?? []).filter((mi) => !successIDs.has(mi.id)));
    this.checkedMediaItems.set(new Set());
  }

  selectMedia(item: MediaItemDto) {
    this.selectedMediaItem.set(item);
  }

  toggleItemChecked(item: MediaItemDto, checked: boolean) {
    const items = this.checkedMediaItems();
    items[checked ? 'add' : 'delete'](item.id);
    this.checkedMediaItems.set(items);
  }

  private async initMasonry() {
    const masonryDiv = this.masonryDiv();
    if (!masonryDiv?.nativeElement || !this.masonryLib) return;

    this.destroyMasonry();

    this.masonry = new this.masonryLib(masonryDiv.nativeElement, {
      itemSelector: '[data-masonry-item]',
      columnWidth: '[data-masonry-sizer]',
      percentPosition: true,
      transitionDuration: 0,
    });

    this.imagesOnlyLib?.(masonryDiv.nativeElement).on('progress', this.imagesLoadedCB);
  }

  private destroyMasonry() {
    this.masonry?.destroy?.();

    const masonryDiv = this.masonryDiv();
    if (!masonryDiv?.nativeElement) return;

    this.imagesOnlyLib?.(masonryDiv.nativeElement).off('progress', this.imagesLoadedCB);
  }

  private _imagesLoadedCB() {
    this.masonry?.layout?.();
  }
}
