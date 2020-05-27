import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DailyAssessmentsComponent } from './daily-assessments.component';

describe('DailyAssessmentsComponent', () => {
  let component: DailyAssessmentsComponent;
  let fixture: ComponentFixture<DailyAssessmentsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DailyAssessmentsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DailyAssessmentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
