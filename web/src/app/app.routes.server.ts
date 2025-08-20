import { RenderMode, ServerRoute } from '@angular/ssr';

export const serverRoutes: ServerRoute[] = [
  { path: '', renderMode: RenderMode.Server },
  { path: 'categories', renderMode: RenderMode.Server },
  { path: 'category/:id', renderMode: RenderMode.Server },
  { path: 'uncategorised', renderMode: RenderMode.Server },
  { path: '**', renderMode: RenderMode.Server },
];
