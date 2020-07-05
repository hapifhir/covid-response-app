import { Component, OnInit, Input } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import * as FHIR from './../../interfaces/FHIR';
import { FhirOperationsService } from 'src/app/services/fhir-operations.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-daily-assessments',
  templateUrl: './daily-assessments.component.html',
  styleUrls: ['./daily-assessments.component.css']
})
export class DailyAssessmentsComponent implements OnInit {

  constructor(private httpService: HttpService, private fhirOperations: FhirOperationsService,
    private route: ActivatedRoute, private router: Router) { }
  @Input() questId: string;
  questions: any;
  questionnaireResponse: any;
  loadData: boolean;
  eocId;
  patientDetails;
  finishloadQuest: boolean;
  finishloadResp: boolean;

  ngOnInit(): void {
    this.eocId = this.route.snapshot.params.eocId;
    this.questId = this.route.snapshot.queryParamMap.get('questId'); 
    this.loadForm();

    if ( this.questId != null && this.questId != undefined )
    {
      this.loadQuestionnaireResponse();
    }else
    {
      this.getPatientBundle();
    }
  }

  loadForm() {
    this.httpService.getResourceByQueryParam('Questionnaire', '?identifier=WHO_Module_2').then(res => {
      const resource = res['entry'][0].resource;
      this.questions = resource;
      this.finishloadQuest = true;
      if ( this.questId != null && this.questId != undefined )
        this.loadData = this.finishloadQuest && this.finishloadResp;
      else
        this.loadData = true;
        
    }).catch(error => {
      console.log(Promise.reject(error));
    });
  }
  async loadQuestionnaireResponse()
  {
    this.questionnaireResponse = await this.httpService.getResourceByQueryParam('QuestionnaireResponse', '/' + this.questId );
    this.finishloadResp = true;
    this.loadData = this.finishloadQuest && this.finishloadResp;
    
  }

  async getPatientBundle() {
    const patientBundle = await this.httpService.getResourceByQueryParam('EpisodeOfCare', '?_id=' + this.eocId + '&_include=*');
    this.patientDetails = patientBundle['entry'].filter(i => i.resource.resourceType === 'Patient')[0].resource;
  }

  async submitQuestionnaire(formQuestions: any) {
    console.log(formQuestions);
    // create transaction bundle
    const transaction = new FHIR.Bundle();
    transaction.resourceType = 'Bundle';
    transaction.type = 'transaction';
    transaction.entry = [];
    
    const encounterHL7 = this.fhirOperations.generateEncounter('EpisodeOfCare/' + this.eocId, 'Patient/' +  this.patientDetails.id, 'in-progress');
    const entry_five = new FHIR.Entry();
    entry_five.resource = encounterHL7;

    const req_five = new FHIR.Request();
    req_five.method = 'POST';
    req_five.url = 'Encounter';

    entry_five.request = req_five;

    transaction.entry.push(entry_five);

    // create question response resource
    const questionnaireResponse = this.fhirOperations.generateQuestionnaireResponse(formQuestions, this.questions,'Patient/' + this.patientDetails.id,  'WHO_MODULE_2_Questionnaire_Response');
    const entry_three = new FHIR.Entry();
    entry_three.resource = questionnaireResponse;

    const req_three = new FHIR.Request();
    req_three.method = 'POST';
    req_three.url = 'QuestionnaireResponse';

    entry_three.request = req_three;

    transaction.entry.push(entry_three);

    console.log('transaction', transaction);

    try{
      const transactionResponse = await this.httpService.postTransaction(transaction);
      this.router.navigate(['patient-details', this.patientDetails.id]);
    }catch (error)
    {
      console.log(error);
    }
  }

}
