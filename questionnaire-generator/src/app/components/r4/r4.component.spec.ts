import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { R4Component } from './r4.component';

describe('R4Component', () => {
  let component: R4Component;
  let fixture: ComponentFixture<R4Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ R4Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(R4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
