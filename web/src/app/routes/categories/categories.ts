import {
  afterNextRender,
  Component,
  computed,
  ElementRef,
  inject,
  signal,
  viewChild,
} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import {
  CategoriesApi,
  CategoryDto,
  CategoryTagDto,
  CategoryTagsApi,
} from '../../../../typescript-axios';
import { ConfigService } from '../../services/config';

@Component({
  selector: 'app-categories',
  imports: [FormsModule, RouterLink],
  templateUrl: './categories.html',
  styleUrl: './categories.css',
})
export class Categories {
  private readonly router = inject(Router);
  private readonly configService = inject(ConfigService);

  readonly categories = signal<CategoryDto[] | null>(null);
  readonly newCategoryName = signal<string>('');
  readonly newCategoryDescription = signal<string>('');
  readonly newCategoryTags = signal<number[]>([]);
  readonly categoryTags = signal<CategoryTagDto[] | null>(null);
  readonly newCategoryTagName = signal<string>('');
  readonly newCategoryTagColour = signal<string>('');
  readonly selectedCategoryTags = signal<number[]>([]);
  readonly filter = signal<string>('');
  readonly filteredCategories = computed(() => {
    const categories = this.categories();
    const selectedCategoryTags = this.selectedCategoryTags();
    const filter = this.filter().toLowerCase();
    if (!categories || (!selectedCategoryTags && !filter)) return categories;

    return categories.filter((c) => {
      if (filter && !c.name.toLowerCase().includes(filter)) return false;

      const tagIDs = (c.tags ?? []).map((t) => t.id);
      if (
        selectedCategoryTags.length > 0 &&
        !tagIDs.some((t) => selectedCategoryTags.includes(t))
      ) {
        return false;
      }

      return true;
    });
  });

  private categoriesApi?: CategoriesApi;
  private categoryTagsApi?: CategoryTagsApi;

  private createCategoryDialog =
    viewChild.required<ElementRef<HTMLDialogElement>>('createCategoryDialog');
  private createCategoryTagDialog =
    viewChild.required<ElementRef<HTMLDialogElement>>('createCategoryTagDialog');

  constructor() {
    afterNextRender(() => {
      if (!this.configService.isProvisioned()) {
        this.router.navigate(['/']);
      }

      this.categoriesApi = new CategoriesApi(undefined, this.configService.getBaseURL());
      this.categoryTagsApi = new CategoryTagsApi(undefined, this.configService.getBaseURL());
      this.loadCategories();
      this.loadCategoryTags();
    });
  }

  async loadCategories() {
    if (!this.categoriesApi) return;

    const response = await this.categoriesApi.findAll();
    this.categories.set(response.data);
  }

  async createCategory() {
    if (!this.categoriesApi) return;

    const newCategoryName = this.newCategoryName();
    const newCategoryDescription = this.newCategoryDescription();
    if (!newCategoryName.trim()) return;

    const response = await this.categoriesApi.create({
      name: newCategoryName,
      description: newCategoryDescription,
      tags: this.newCategoryTags(),
    });
    if (response.status !== 201) {
      alert('Error creating category.');
      return;
    }

    this.categories.update((c) => [...(c || []), response.data]);
    this.newCategoryName.set('');
    this.newCategoryDescription.set('');
    this.createCategoryDialog().nativeElement.close();
  }

  async createCategoryTag() {
    if (!this.categoryTagsApi) return;

    const newCategoryTagName = this.newCategoryTagName();
    const newCategoryTagColour = this.newCategoryTagColour();
    if (!newCategoryTagName.trim()) return;

    const response = await this.categoryTagsApi.createCategoryTag({
      name: newCategoryTagName,
      colour: newCategoryTagColour,
    });
    if (response.status !== 201) {
      alert('Error creating category tag.');
      return;
    }

    this.categoryTags.update((c) => [...(c || []), response.data]);
    this.newCategoryTagName.set('');
    this.newCategoryTagColour.set('');
    this.createCategoryTagDialog().nativeElement.close();
  }

  async deleteCategory(id: string) {
    if (!this.categoriesApi) return;

    if (!confirm('Are you sure you want to delete this category?')) return;

    const response = await this.categoriesApi.remove(id);
    if (response.status !== 200) {
      alert('Failed deleting category.');
      return;
    }

    this.categories.update((c) => (c || []).filter((sc) => sc.id !== id));
  }

  async loadCategoryTags() {
    if (!this.categoryTagsApi) return;

    const response = await this.categoryTagsApi.getCategoryTags();
    this.categoryTags.set(response.data);
  }

  async deleteCategoryTag(id: number) {
    if (!this.categoryTagsApi) return;

    if (!confirm('Are you sure you want to delete this category tag?')) return;

    const response = await this.categoryTagsApi.deleteCategoryTag(id);
    if (response.status !== 200) {
      alert('Failed deleting category tag.');
      return;
    }

    this.categoryTags.update((c) => (c || []).filter((sc) => sc.id !== id));
  }

  toggleTagSelected(id: number, checked: boolean) {
    if (checked) {
      this.selectedCategoryTags.update((s) => [...s, id]);
    } else {
      this.selectedCategoryTags.update((s) => s.filter((i) => i !== id));
    }
  }

  getThumbnailUrl(category: CategoryDto): string | null {
    if (!category.thumbnail) return null;

    const mediaType = category.thumbnail.mediaType;
    const isVideoOrGIF = mediaType.startsWith('video/') || mediaType === 'image/gif';
    return isVideoOrGIF
      ? `${this.configService.getBaseURL()}/static/thumbnails/${category.thumbnail.id}.png`
      : `${this.configService.getBaseURL()}/static/${category.thumbnail.id}.${category.thumbnail.extension}`;
  }

  getOptimalTextColor(colour: string): string {
    const rgb = colour.replace('#', '');
    const r = parseInt(rgb.substring(0, 2), 16);
    const g = parseInt(rgb.substring(2, 4), 16);
    const b = parseInt(rgb.substring(4, 6), 16);
    const yiq = (r * 299 + g * 587 + b * 114) / 1000;
    return yiq >= 128 ? '#000000' : '#FFFFFF';
  }
}
