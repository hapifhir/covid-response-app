import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PatientQuestionnaireComponent } from './patient-questionnaire.component';

describe('PatientQuestionnaireComponent', () => {
  let component: PatientQuestionnaireComponent;
  let fixture: ComponentFixture<PatientQuestionnaireComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PatientQuestionnaireComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PatientQuestionnaireComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
