import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IsmSwitch } from './ism-switch';

describe('IsmSwitch', () => {
  let component: IsmSwitch;
  let fixture: ComponentFixture<IsmSwitch>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [IsmSwitch]
    })
    .compileComponents();

    fixture = TestBed.createComponent(IsmSwitch);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
