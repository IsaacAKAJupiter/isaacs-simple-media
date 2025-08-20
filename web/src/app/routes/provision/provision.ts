import { afterNextRender, Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { ConfigService } from '../../services/config';

@Component({
  selector: 'app-provision',
  imports: [FormsModule],
  templateUrl: './provision.html',
  styleUrl: './provision.css',
})
export class Provision {
  private readonly router = inject(Router);
  private readonly configService = inject(ConfigService);

  apiURL = signal<string>('');

  constructor() {
    afterNextRender(() => {
      this.apiURL.set(this.configService.FALLBACK_URL);

      if (this.configService.isProvisioned()) {
        this.router.navigate(['/categories']);
      }
    });
  }

  saveURL() {
    const url = this.apiURL();
    if (!url) return;

    localStorage.setItem('apiURL', url);
    this.router.navigate(['/categories']);
  }
}
