import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Dstu3Component } from './dstu3.component';

describe('Dstu3Component', () => {
  let component: Dstu3Component;
  let fixture: ComponentFixture<Dstu3Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Dstu3Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Dstu3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
