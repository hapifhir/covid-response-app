import { Component, OnInit } from '@angular/core';
import { HttpService } from './../../services/http.service';
import { FormGroup, FormControl, FormArray, Validators, ValidatorFn } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';
import { UtilService } from './../../services/util.service';
import { FhirOperationsService } from './../../services/fhir-operations.service';
@Component({
  selector: 'app-patient-questionnaire',
  templateUrl: './patient-questionnaire.component.html',
  styleUrls: ['./patient-questionnaire.component.css']
})
export class PatientQuestionnaireComponent implements OnInit {

  constructor(private httpService: HttpService, private cookieService: CookieService,
    private utilService: UtilService, private fhirOperationsService: FhirOperationsService) { }
  questionnaire;
  questionnaireResponseForm: FormGroup;
  questionSet;
  contactHealthCareProvider: string;
  resultString: string;

  ngOnInit(): void {
    this.fetchQuestionnaire();
    this.questionnaireResponseForm = new FormGroup({
      answerSet: new FormArray([], this.customValidateArrayGroup()),
      postalCode: new FormControl('', Validators.maxLength(3))
    });
  }

  getConsent() {
    const consentGiven = this.cookieService.get('consentGiven');
    return consentGiven ? true : false;
  }

  async fetchQuestionnaire() {
    const bundle: any = await this.httpService.getResourceByQueryParam('Questionnaire', '?identifier=covid-questionnaire');
    this.questionnaire = bundle.entry[0].resource;
    this.processQuestionnaire();
  }

  processQuestionnaire() {
    const item = this.questionnaire.item;
    this.questionSet = [];
    item.forEach(question => {
      if (question.type === 'boolean') {
        this.questionSet.push(this.utilService.extractAnswers(question));
      }
    });
    const answerArray: FormArray = this.questionnaireResponseForm.get('answerSet') as FormArray;
    this.questionSet.forEach(question => {
      answerArray.push(new FormControl(false));
    });
  }

  async onSubmit() {
    if (this.questionnaireResponseForm.valid) {
      const formValues = this.questionnaireResponseForm.value;
      const selectedIndexes = this.utilService.getAllIndexes(formValues.answerSet, true);
      const answersSelected = selectedIndexes.map(i => this.questionSet[i]);
      const outcome = this.getOutcome(answersSelected);
      const responseItems = JSON.parse(JSON.stringify(this.questionSet));
      for (let index = 0; index < responseItems.length; index++)  {
        const element = responseItems[index];
        if(selectedIndexes.includes(index)) {
          element.isSelected = true;
        }
      }
      responseItems.push(outcome);
      if(formValues.postalCode) {
        responseItems.push(formValues.postalCode);
      }
      let currentIdentifier = this.cookieService.get('userIdentifier');
      if(!currentIdentifier) {
        const identifier = this.utilService.randomString(16);
        currentIdentifier = identifier;
        this.cookieService.set('userIdentifier', identifier, 1);
      }
      const questionnaireResponse = this.fhirOperationsService.generateQuestionnaireResponse(responseItems, currentIdentifier);
      const postQuestionnaireResponse = await this.httpService.postResource(questionnaireResponse);
      this.questionnaireResponseForm.reset();
    }
  }

  customValidateArrayGroup(): ValidatorFn {
    return (formArray: FormArray): { [key: string]: any } | null => {
      const isValid = formArray.controls.find(element => element.value === true);
      return isValid ? null : { error: 'Please Select One' };
    };
  }

  getOutcome(answersSelected) {
    let resultObject;
    const symptomsCode = "sign-of-symptoms";
    const symptomsNotFound = answersSelected.find(x => this.utilService.compareValues(x.code, symptomsCode));
    if (symptomsNotFound) {
      resultObject = this.questionnaire.item.find(x => x.linkId === 'contact_healthcare_provider');
      this.resultString = resultObject.text;
    } else {
      const tarvelAndContactCodes = ["contact-with-victim-having-travel-history", "recent-travel", "contact-with-victim"];
      const healthCodes = ["age-verfication", "diabetes-and-bp-verification", "chronic-disease-verification"];
      const travelAndContactInformation = answersSelected.filter(item => tarvelAndContactCodes.includes(item.code));
      const healthInformation = answersSelected.filter(item => healthCodes.includes(item.code));
      if (travelAndContactInformation.length > 0 && healthInformation.length > 0) {
        resultObject = this.questionnaire.item.find(x => x.linkId === 'seek_clinical_assessment');
        this.resultString = resultObject.text;
      } else if (travelAndContactInformation.length > 0) {
        resultObject = this.questionnaire.item.find(x => x.linkId === 'illness_advise');
        this.resultString = resultObject.text;
      } else if (healthInformation.length > 0) {
        resultObject = this.questionnaire.item.find(x => x.linkId === 'contact_healthcare_provider_for_reassessment');
        this.resultString = resultObject.text;
      }
    }
    return resultObject;
  }

  changeView() {
    this.resultString = null;
  }
}
