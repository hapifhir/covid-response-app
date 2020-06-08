import { Component, OnInit, Input } from '@angular/core';
import { HttpService } from '../../services/http.service';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { FhirOperationsService } from '../../services/fhir-operations.service';
import { v4 as uuidv4 } from 'uuid';
import * as FHIR from '../../interfaces/FHIR';

@Component({
  selector: 'app-discharge-death',
  templateUrl: './discharge-death.component.html',
  styleUrls: ['./discharge-death.component.css']
})
export class DischargeDeathComponent implements OnInit {
  @Input() questId: string;
  questions: any;
  loadData: boolean;
  eocId: string;
  patientDetails: FHIR.Patient;
  eoc: FHIR.EpisodeOfCare;
  questionnaireResponse: any;
  finishloadQuest: boolean;
  finishloadResp: boolean;

  constructor(private httpService: HttpService, private route: ActivatedRoute, private fhirOperations: FhirOperationsService,
    private router: Router) { }


  ngOnInit(): void {
    
    this.route.queryParamMap.subscribe(params => {
      this.eocId = this.route.snapshot.params.eocId;
    });
    this.questId = this.route.snapshot.queryParamMap.get('questId')
  
    this.loadForm();
    
    if ( this.questId != null && this.questId != undefined )
    {
      this.loadQuestionnaireResponse();
    }else
    {
      this.getResourcesBundle();
    }
  }
  async loadForm() {

    const res = await this.httpService.getResourceByQueryParam('Questionnaire', '?identifier=WHO_Module_3');
    const resource = res['entry'][0].resource;
    this.questions = resource;
    this.finishloadQuest = true;
    if ( this.questId != null && this.questId != undefined )
      this.loadData = this.finishloadQuest && this.finishloadResp;
    else
      this.loadData = true;
      
  }
 
  async loadQuestionnaireResponse()
  {
    this.questionnaireResponse = await this.httpService.getResourceByQueryParam('QuestionnaireResponse', '/' + this.questId );
    this.finishloadResp = true;
    this.loadData = this.finishloadQuest && this.finishloadResp;
    
  }

  async getResourcesBundle() {
    const resourcesBundle = await this.httpService.getResourceByQueryParam('EpisodeOfCare', '?_id=' + this.eocId + '&_include=*');
    this.patientDetails = <FHIR.Patient>resourcesBundle['entry'].filter(i => i.resource.resourceType === 'Patient')[0].resource;
    this.eoc = <FHIR.EpisodeOfCare>resourcesBundle['entry'].filter(i => i.resource.resourceType === 'EpisodeOfCare')[0].resource;
  }

  async submitQuestionnaire(formQuestions: any) {

    // create transaction bundle
    const transaction = new FHIR.Bundle();
    transaction.resourceType = 'Bundle';
    transaction.type = 'transaction';
    transaction.entry = [];

    const patientFullId = 'Patient/' + this.patientDetails.id;

    // update episode of care
    const entry_one = new FHIR.Entry();
    entry_one.fullUrl = 'EpisodeOfCare/' + this.eocId;
    this.eoc.status = 'finished';
    entry_one.resource = this.eoc;

    const req_one = new FHIR.Request();
    req_one.method = 'PUT';
    req_one.url = 'EpisodeOfCare/' + this.eocId;

    entry_one.request = req_one;

    transaction.entry.push(entry_one);

    // create question response resource
    const questionnaireResponse = this.fhirOperations.generateQuestionnaireResponse(formQuestions, this.questions, patientFullId, "WHO_Module_3_Questionnaire_Response");
    const entry_two = new FHIR.Entry();
    entry_two.resource = questionnaireResponse;

    const req_two = new FHIR.Request();
    req_two.method = 'POST';
    req_two.url = 'QuestionnaireResponse';

    entry_two.request = req_two;

    transaction.entry.push(entry_two);

    const encounterHL7 = this.fhirOperations.generateEncounter('EpisodeOfCare/' + this.eocId, patientFullId, 'finished');
    const entry_three = new FHIR.Entry();
    entry_three.resource = encounterHL7;

    const req_three = new FHIR.Request();
    req_three.method = 'POST';
    req_three.url = 'Encounter';

    entry_three.request = req_three;

    transaction.entry.push(entry_three);

    console.log('transaction', transaction);

    //post

    try {
      const transactionResponse = await this.httpService.postTransaction(transaction);
      this.router.navigate(['dashboard']);
    } catch (error) {
      console.log(error);
    }
  }
}
