import { Routes } from '@angular/router';
import { Categories } from './routes/categories/categories';
import { Category } from './routes/category/category';
import { Provision } from './routes/provision/provision';

export const routes: Routes = [
  { path: '', component: Provision },
  { path: 'categories', component: Categories },
  { path: 'category/:id', component: Category },
  { path: 'uncategorised', component: Category },
  { path: '**', redirectTo: '' },
];
