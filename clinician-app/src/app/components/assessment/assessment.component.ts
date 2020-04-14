import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, ValidatorFn, FormBuilder } from '@angular/forms';
import { FhirOperationsService } from './../../services/fhir-operations.service';
import { HttpService } from './../../services/http.service';

@Component({
  selector: 'app-assessment',
  templateUrl: './assessment.component.html',
  styleUrls: ['./assessment.component.css']
})
export class AssessmentComponent implements OnInit {

  constructor(private formBuilder: FormBuilder, private fhirOperations: FhirOperationsService,
    private httpService: HttpService) { }
  sarsForm: FormGroup;
  formSubmitted = false;
  ngOnInit(): void {
    this.sarsForm = this.formBuilder.group({
      health_care_provider: this.formBuilder.group({
        full_name: ['', Validators.required],
        phone: ['', [Validators.required, Validators.pattern("^[0-9]{10,12}$")]],
        fax: ['', Validators.required]
      }),
      patient_demographics: this.formBuilder.group({
        first_name: ['', Validators.required],
        last_name: ['', Validators.required],
        birth_date: ['', Validators.required],
        gender_choice: ['', Validators.required],
        address: ['', Validators.required],
        city: ['', Validators.required],
        province: ['', Validators.required],
        postal_code: ['', Validators.required],
        phone: ['', [Validators.required, Validators.pattern("^[0-9]{10,12}$")]]
      }),
      symptoms: this.formBuilder.group({
        fever_bool: ['', Validators.required],
        fever_onset_date: [''],
        fever_comments: [''],
        cough_bool: ['', Validators.required],
        cough_onset_date: [''],
        cough_comments: [''],
        other_bool: ['', Validators.required],
        other_onset_date: [''],
        other_comment: ['']
      }),
      exposures: this.formBuilder.group({
        travel_bool: ['', Validators.required],
        travel_begin_date: [''],
        travel_end_date: [''],
        travel_areas: [''],
        close_contact_before_symptom_bool: ['', Validators.required],
        close_contact_before_symptom_begin_date: [''],
        close_contact_before_symptom_end_date: [''],
        close_contact_before_symptom_begin_date_comment: [''],
        close_contact_with_travel_bool: ['', Validators.required],
        close_contact_with_travel_begin_date: [''],
        close_contact_with_travel_end_date: [''],
        close_contact_with_travel_return_date: [''],
        close_contact_with_travel_symptom_onset_date: ['']
      }),
      actions: this.formBuilder.group({
        meets_probable_case_bool: ['', Validators.required],
        patient_working_in_healthcare_bool: ['', Validators.required],
        patient_working_in_healthcare_comments: [''],
        testing_conducted_bool: ['', Validators.required],
        testing_conducted_date: [''],
        additional_comment: ['']
      }),
      practitioner: this.formBuilder.group({
        completed_by: ['', Validators.required],
        completed_on_date: ['', Validators.required]
      })
    })
  }

  async onSubmit() {
    if (!this.sarsForm.invalid) {
      const formValues = this.sarsForm.value;
      const questionnaireResponse = this.fhirOperations.generateQuestionnaireResponse(formValues);
      this.formSubmitted = true;
      const postQuestionnaireResponse = await this.httpService.postResource(questionnaireResponse);
    }
  }

  // custom validation for fields, will be replaced by dynamic form
  handleChange(formControlName) {
    const formControl = this.sarsForm.get(formControlName);
    if (formControlName === 'symptoms.fever_bool') {
      if (formControl.value === 'yes') {
        this.sarsForm.get('symptoms.fever_onset_date').setValidators(Validators.required);
      } else {
        this.sarsForm.get('symptoms.fever_onset_date').clearValidators();
        this.sarsForm.get('symptoms.fever_onset_date').setValue('');
      }
    } else if (formControlName === 'symptoms.cough_bool') {
      if (formControl.value === 'yes') {
        this.sarsForm.get('symptoms.cough_onset_date').setValidators(Validators.required);
      } else {
        this.sarsForm.get('symptoms.cough_onset_date').clearValidators();
        this.sarsForm.get('symptoms.cough_onset_date').setValue('');
      }
    } else if (formControlName === 'symptoms.other_bool') {
      if (formControl.value === 'yes') {
        this.sarsForm.get('symptoms.other_onset_date').setValidators(Validators.required);
      } else {
        this.sarsForm.get('symptoms.other_onset_date').clearValidators();
        this.sarsForm.get('symptoms.other_onset_date').setValue('');
      }
    } else if (formControlName === 'exposures.travel_bool') {
      if(formControl.value === 'yes') {
        this.sarsForm.get('exposures.travel_begin_date').setValidators(Validators.required);
        this.sarsForm.get('exposures.travel_end_date').setValidators(Validators.required);
        this.sarsForm.get('exposures.travel_areas').setValidators(Validators.required);
      } else {
        this.sarsForm.get('exposures.travel_begin_date').clearValidators();
        this.sarsForm.get('exposures.travel_end_date').clearValidators();
        this.sarsForm.get('exposures.travel_areas').clearValidators();
        this.sarsForm.get('exposures.travel_begin_date').setValue('');
        this.sarsForm.get('exposures.travel_end_date').setValue('');
        this.sarsForm.get('exposures.travel_areas').setValue('');
      }
    } else if (formControlName === 'exposures.close_contact_before_symptom_bool') {
      if(formControl.value === 'yes') {
        this.sarsForm.get('exposures.close_contact_before_symptom_begin_date').setValidators(Validators.required);
        this.sarsForm.get('exposures.close_contact_before_symptom_end_date').setValidators(Validators.required);
      } else {
        this.sarsForm.get('exposures.close_contact_before_symptom_begin_date').clearValidators();
        this.sarsForm.get('exposures.close_contact_before_symptom_end_date').clearValidators();
        this.sarsForm.get('exposures.close_contact_before_symptom_end_date').setValue('');
        this.sarsForm.get('exposures.close_contact_before_symptom_begin_date').setValue('');
      }
    } else if (formControlName === 'exposures.close_contact_with_travel_bool') {
      if(formControl.value === 'yes') {
        this.sarsForm.get('exposures.close_contact_with_travel_begin_date').setValidators(Validators.required);
        this.sarsForm.get('exposures.close_contact_with_travel_end_date').setValidators(Validators.required);
        this.sarsForm.get('exposures.close_contact_with_travel_return_date').setValidators(Validators.required);
        this.sarsForm.get('exposures.close_contact_with_travel_symptom_onset_date').setValidators(Validators.required);
      } else {
        this.sarsForm.get('exposures.close_contact_with_travel_begin_date').clearValidators();
        this.sarsForm.get('exposures.close_contact_with_travel_end_date').clearValidators();
        this.sarsForm.get('exposures.close_contact_with_travel_return_date').clearValidators();
        this.sarsForm.get('exposures.close_contact_with_travel_symptom_onset_date').clearValidators();
        this.sarsForm.get('exposures.close_contact_with_travel_begin_date').setValue('');
        this.sarsForm.get('exposures.close_contact_with_travel_end_date').setValue('');
        this.sarsForm.get('exposures.close_contact_with_travel_return_date').setValue('');
        this.sarsForm.get('exposures.close_contact_with_travel_symptom_onset_date').setValue('');
      }
    } else if (formControlName === 'actions.patient_working_in_healthcare_bool') {
      if (formControl.value === 'yes') {
        this.sarsForm.get('actions.patient_working_in_healthcare_comments').setValidators(Validators.required);
      } else {
        this.sarsForm.get('actions.patient_working_in_healthcare_comments').clearValidators();
        this.sarsForm.get('actions.patient_working_in_healthcare_comments').setValue('');
      }
    } else if (formControlName === 'actions.testing_conducted_bool') {
      if (formControl.value === 'yes') {
        this.sarsForm.get('actions.testing_conducted_date').setValidators(Validators.required);
      } else {
        this.sarsForm.get('actions.testing_conducted_date').clearValidators();
        this.sarsForm.get('actions.testing_conducted_date').setValue('');
      }
    }
  }

  changeView() {
    this.sarsForm.reset();
    this.formSubmitted = false;
  }

}
