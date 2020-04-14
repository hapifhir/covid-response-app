import { Injectable } from '@angular/core';
import * as FHIR from './../interfaces/FHIR';

@Injectable({
  providedIn: 'root'
})
export class FhirOperationsService {

  constructor() { }

  generateQuestionnaireResponse(formValues) {
    const scope = this;
    const questionnaireResponse = new FHIR.QuestionnaireResponse();
    const identifier = new FHIR.Identifier();
    identifier.value = 'SARS_Questionnaire_Response';
    questionnaireResponse.identifier = identifier;
    questionnaireResponse.resourceType = 'QuestionnaireResponse'
    questionnaireResponse.status = 'completed';
    questionnaireResponse.authored = new Date();
    questionnaireResponse.item = [];
    Object.keys(formValues).forEach(function(parentKey) {
      Object.keys(formValues[parentKey]).forEach(function(childKey) {
        const questionnaireResponseItem = scope.generateQuestionnaireResponseItem(parentKey + '_' + childKey, formValues[parentKey][childKey]);
        if(questionnaireResponseItem !== null) {
          questionnaireResponse.item.push(questionnaireResponseItem);
        }
      }) 
  });
    return questionnaireResponse;
  }

  generateQuestionnaireResponseItem(linkId, childItem) {
    let returnItem = null;
    if(childItem) {
      const questionnaireResponseItem = new FHIR.QuestionnaireResponseItem();
      const questionnaireAnswer = new FHIR.Answer();
      questionnaireResponseItem.answer = [];
      if(linkId.includes("_bool")) {
        questionnaireAnswer.valueBoolean = childItem === "yes" ? true : false;
      } else if(linkId.includes("_choice")) {
        questionnaireAnswer.valueCoding = new FHIR.Coding();
        questionnaireAnswer.valueCoding.code = childItem;
      } else if(linkId.includes("_date")) {
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
}
