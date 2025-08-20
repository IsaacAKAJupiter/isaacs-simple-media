import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Provision } from './provision';

describe('Provision', () => {
  let component: Provision;
  let fixture: ComponentFixture<Provision>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Provision]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Provision);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
