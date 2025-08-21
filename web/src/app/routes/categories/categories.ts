import { afterNextRender, Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { CategoriesApi, CategoryDto } from '../../../../typescript-axios';
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

  categories = signal<CategoryDto[] | null>(null);
  newCategoryName = signal<string>('');
  newCategoryDescription = signal<string>('');

  private categoriesApi?: CategoriesApi;

  constructor() {
    afterNextRender(() => {
      if (!this.configService.isProvisioned()) {
        this.router.navigate(['/']);
      }

      this.categoriesApi = new CategoriesApi(undefined, this.configService.getBaseURL());
      this.loadCategories();
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
    });
    if (response.status !== 201) {
      alert('Error creating category.');
      return;
    }

    this.categories.update((c) => [...(c || []), response.data]);
    this.newCategoryName.set('');
    this.newCategoryDescription.set('');
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

  getThumbnailUrl(category: CategoryDto): string | null {
    if (!category.thumbnail) return null;

    const mediaType = category.thumbnail.mediaType;
    const isVideoOrGIF = mediaType.startsWith('video/') || mediaType === 'image/gif';
    return isVideoOrGIF
      ? `${this.configService.getBaseURL()}/static/thumbnails/${category.thumbnail.id}.png`
      : `${this.configService.getBaseURL()}/static/${category.thumbnail.id}.${category.thumbnail.extension}`;
  }
}
