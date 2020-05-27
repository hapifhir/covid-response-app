import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DischargeDeathComponent } from './discharge-death.component';

describe('DischargeDeathComponent', () => {
  let component: DischargeDeathComponent;
  let fixture: ComponentFixture<DischargeDeathComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DischargeDeathComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DischargeDeathComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
