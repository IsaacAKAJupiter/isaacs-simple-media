import { isPlatformBrowser } from '@angular/common';
import { inject, Injectable, PLATFORM_ID, signal } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ConfigService {
  private readonly platformID = inject(PLATFORM_ID);

  readonly FALLBACK_URL = 'http://localhost:3333';
  private isBrowser = signal<boolean>(false);

  constructor() {
    this.isBrowser.set(isPlatformBrowser(this.platformID));
  }

  getBaseURL() {
    if (!this.isBrowser()) return this.FALLBACK_URL;

    return localStorage.getItem('apiURL') || this.FALLBACK_URL;
  }

  isProvisioned() {
    if (!this.isBrowser()) return false;

    return !!localStorage.getItem('apiURL');
  }
}
