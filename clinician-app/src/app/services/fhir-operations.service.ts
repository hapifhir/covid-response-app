import { Injectable } from '@angular/core';
import * as FHIR from './../interfaces/FHIR';


@Injectable({
  providedIn: 'root'
})
export class FhirOperationsService {

  constructor() { }

  generateQuestionnaireResponse(formValues, quest: any) {
    const scope = this;
    const questionnaireResponse = new FHIR.QuestionnaireResponse();
    const identifier = new FHIR.Identifier();

    identifier.value = 'SARS_Questionnaire_Response';
    questionnaireResponse.identifier = identifier;
    questionnaireResponse.resourceType = 'QuestionnaireResponse'
    questionnaireResponse.status = 'completed';
    questionnaireResponse.authored = new Date();
    questionnaireResponse.item = [];

    quest.item.forEach(elementGroup => {
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
    console.log(JSON.stringify(answers));
    for (let answer of answers) {
      if (answer.valueCoding.code == responseSelected) {
        return answer;
      }
    }
  }
}
