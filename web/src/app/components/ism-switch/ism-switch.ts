import { Component, model } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'ism-switch',
  imports: [FormsModule],
  templateUrl: './ism-switch.html',
  styleUrl: './ism-switch.css',
})
export class IsmSwitch {
  readonly checked = model<boolean>(false);

  handleOnChange(event: Event) {
    const target = event.target as HTMLInputElement;
    this.checked.set(target.checked);
  }
}
