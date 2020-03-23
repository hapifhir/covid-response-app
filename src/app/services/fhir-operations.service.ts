import { Injectable } from '@angular/core';
import * as FHIR from './../interfaces/FHIR';

@Injectable({
  providedIn: 'root'
})
export class FhirOperationsService {

  constructor() { }

  generateQuestionnaireResponse(answersSelected, identifier) {
    const questionnaireResponse = new FHIR.QuestionnaireResponse();
    questionnaireResponse.resourceType = 'QuestionnaireResponse'
    questionnaireResponse.status = 'completed';
    questionnaireResponse.authored = new Date();   
    questionnaireResponse.item = [];
    const extension= new FHIR.Extension();
    extension.url = 'https://smilecdr.com/extensions/user-cookie'
    extension.valueString = identifier;
    questionnaireResponse.extension = [extension];
    for (let index = 0; index < answersSelected.length; index++) {
      const element = answersSelected[index];
      if(element.type === 'display') {
        const questionnaireResponseItemForOutcome = new FHIR.QuestionnaireResponseItem();
        questionnaireResponseItemForOutcome.linkId = element.linkId;
        questionnaireResponseItemForOutcome.text = element.text;
        questionnaireResponseItemForOutcome.answer = [];
        const outcomeAnswer = new FHIR.Answer();
        outcomeAnswer.valueString = element.text;
        questionnaireResponseItemForOutcome.answer.push(outcomeAnswer);
        questionnaireResponse.item.push(questionnaireResponseItemForOutcome);
      } else if (typeof(element) === 'string') {
        const questionnaireReponseItemForPostalCode = new FHIR.QuestionnaireResponseItem();
        questionnaireReponseItemForPostalCode.linkId = 'postal_code';
        questionnaireReponseItemForPostalCode.answer = [];
        const postalCodeAnswer = new FHIR.Answer();
        postalCodeAnswer.valueString = element;
        questionnaireReponseItemForPostalCode.answer.push(postalCodeAnswer);
        questionnaireResponse.item.push(questionnaireReponseItemForPostalCode);
      } else {
        const questionnaireResponseItem = new FHIR.QuestionnaireResponseItem();
        questionnaireResponseItem.linkId = element.linkId;
        questionnaireResponseItem.text = element.display;
        questionnaireResponseItem.answer = [];
        const questionnaireAnswer = new FHIR.Answer();
        questionnaireAnswer.valueBoolean = element.isSelected ? element.isSelected : false;
        questionnaireResponseItem.answer.push(questionnaireAnswer);
        questionnaireResponse.item.push(questionnaireResponseItem);
      }
    }
    return questionnaireResponse;
  }
}