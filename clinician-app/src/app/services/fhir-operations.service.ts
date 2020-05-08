import { Injectable } from '@angular/core';
import * as FHIR from './../interfaces/FHIR';
import * as moment from 'moment';

@Injectable({
  providedIn: 'root'
})
export class FhirOperationsService {

  constructor() { }

  generateQuestionnaireResponse(formValues, quest: any, serviceRequestUUID) {
    const scope = this;
    const questionnaireResponse = new FHIR.QuestionnaireResponse();
    const identifier = new FHIR.Identifier();

    const basedOnRef = serviceRequestUUID;
    questionnaireResponse.basedOn = [basedOnRef];

    // questionnaire id
    const questionnaireId = quest.resourceType + '/' + quest.id;
    questionnaireResponse.questionnaire = questionnaireId;

    identifier.value = 'WHO_MODULE_1_Questionnaire_Response';
    questionnaireResponse.identifier = identifier;
    questionnaireResponse.resourceType = 'QuestionnaireResponse'
    questionnaireResponse.status = 'completed';
    questionnaireResponse.authored = new Date();
    questionnaireResponse.item = [];

    quest.item.forEach(elementGroup => {
      // console.log('elementGroup', elementGroup);
      if (elementGroup.linkId != 'patient_demographics') {
        const questionnaireResponseGroupItem = scope.generateQuestionnaireResponseGroupItem(elementGroup.linkId, elementGroup.text);
        questionnaireResponseGroupItem.item = [];
        elementGroup.item.forEach(elementItem => {
          const questionnaireResponseItem = scope.generateQuestionnaireResponseItem(elementItem, elementGroup.linkId + '_' + elementItem.linkId, formValues[elementGroup.linkId][elementItem.linkId]);
          if (questionnaireResponseItem !== null) {
            questionnaireResponseGroupItem.item.push(questionnaireResponseItem);
          }
        });
        if (questionnaireResponseGroupItem.item.length > 0)
          questionnaireResponse.item.push(questionnaireResponseGroupItem);
      }
    });

    return questionnaireResponse;
  }

  generateQuestionnaireResponseGroupItem(linkId, text) {
    const questionnaireResponseGroupItem = new FHIR.QuestionnaireResponseGroupItem();
    questionnaireResponseGroupItem.linkId = linkId;
    questionnaireResponseGroupItem.text = text;
    return questionnaireResponseGroupItem;
  }

  generateQuestionnaireResponseItem(elementItem, linkId, childItem) {
    let returnItem = null;

    if (childItem) {
      const questionnaireResponseItem = new FHIR.QuestionnaireResponseItem();
      const questionnaireAnswer = new FHIR.Answer();
      questionnaireResponseItem.answer = [];
      var answer: FHIR.AnswerOption;

      if (elementItem.type == "boolean") {
        questionnaireAnswer.valueBoolean = childItem === "yes" ? true : false;
      } else if (elementItem.type == "choice") {
        questionnaireAnswer.valueCoding = new FHIR.Coding();
        questionnaireAnswer.valueCoding.code = childItem;
        answer = this.getAnswerSelected(elementItem.answerOption, childItem)
        questionnaireAnswer.valueCoding.system = answer.valueCoding.system;
        questionnaireAnswer.valueCoding.display = answer.valueCoding.display;

      } else if (elementItem.type == "date") {
        questionnaireAnswer.valueDate = new Date(childItem);
      } else {
        questionnaireAnswer.valueString = childItem;
      }
      questionnaireResponseItem.linkId = linkId;
      questionnaireResponseItem.answer.push(questionnaireAnswer);
      returnItem = questionnaireResponseItem
    }

    return returnItem;
  }

  getAnswerSelected(answers, responseSelected) {
    // console.log(JSON.stringify(answers));
    for (let answer of answers) {
      if (answer.valueCoding.code == responseSelected) {
        return answer;
      }
    }
  }

  generatePatient(patientObj) {
    const patient = new FHIR.Patient();
    patient.resourceType = 'Patient';
    patient.active = true;
    
    const humanName = new FHIR.HumanName();
    humanName.family = patientObj.last_name;
    humanName.given = []
    humanName.given.push(patientObj.first_name);
    patient.name = [humanName];

    patient.gender = patientObj.sex_at_birth;

    // clearity date is in format MM/DD/YYYY
    patient.birthDate = moment(patientObj.date_of_birth, 'MM-DD-YYYY').format('YYYY-MM-DD');

    const address = new FHIR.Address();
    address.line = [patientObj.address_line_1];
    address.city = patientObj.address_city;
    address.state = patientObj.address_province;
    address.postalCode = patientObj.address_postal_code;
    address.country = patientObj.address_country;
    patient.address = [address];

    // extensions
    patient.extension = [];

    const healthcare_worker = new FHIR.Extension();
    healthcare_worker.url = 'https://smilecdr.com/extensions/healthcare-worker';
    healthcare_worker.valueString = patientObj.healthcare_worker;

    patient.extension.push(healthcare_worker);

    const laboratory_worker = new FHIR.Extension();
    laboratory_worker.url = 'https://smilecdr.com/extensions/laboratory-worker';
    laboratory_worker.valueString = patientObj.laboratory_worker;

    patient.extension.push(laboratory_worker);

    const pregnant = new FHIR.Extension();
    pregnant.url = 'https://smilecdr.com/extensions/pregnant';
    pregnant.valueString = patientObj.pregnant;

    patient.extension.push(pregnant);

    if (patientObj.pregnant == 'yes' && patientObj.gestational_weeks_assessment) {
      const gestational_weeks_assessment = new FHIR.Extension();
      gestational_weeks_assessment.url = 'https://smilecdr.com/extensions/gestational-weeks-assessment';
      gestational_weeks_assessment.valueString = patientObj.gestational_weeks_assessment;

      patient.extension.push(gestational_weeks_assessment);
    }

    return patient;
  }

  generateServiceRequest(subject) {
    // {
    //   "resourceType": "ServiceRequest",
    //   "status": "active",
    //   "intent": "order",
    //   "priority": "routine",
    //   "subject": {
    //     "reference": "Patient/example"
    //   },
    //   "authoredOn": "2013-05-02T16:16:00-07:00"  // skipped for now
    // }

    const sr = new FHIR.ServiceRequest();
    sr.resourceType = 'ServiceRequest';
    sr.status = 'active';
    sr.intent = 'order';
    sr.priority = 'routine';

    const _subject = new FHIR.Reference();
    _subject.reference = subject;
    sr.subject = _subject;

    // sr.authoredOn = 

    return sr;
  }
}
