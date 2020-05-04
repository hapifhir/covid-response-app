import { Component, OnInit, Input } from '@angular/core';
import { HttpService } from '../../services/http.service';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { QvScheme } from '../../interfaces/qvscheme';
import { FhirOperationsService } from '../../services/fhir-operationsQuest.service';


@Component({
  selector: 'app-admit-patient',
  templateUrl: './admit-patient.component.html',
  styleUrls: ['./admit-patient.component.css']
})
export class AdmitpatientComponent implements OnInit {
  questions: any;
  loadData: boolean;


  constructor(private httpService: HttpService, private route: ActivatedRoute, private fhirOperations: FhirOperationsService) { }

  ngOnInit(): void {
    this.loadForm();
  }

  loadForm() {
    this.httpService.getResourceByQueryParam(environment.questionnariRes, '?identifier=WHO_Module_1').then(res => {
      const resource = res['entry'][0].resource;
      this.questions = resource;
      this.loadData = true;
    }).catch(error => {
      console.log(Promise.reject(error));
    });
  }

  async submitQuestionnaire(formQuestions: any) {
    const questionnaireResponse = this.fhirOperations.generateQuestionnaireResponse(formQuestions, this.questions);
    const postQuestionnaireResponse = await this.httpService.postResource(questionnaireResponse);
  }

}
