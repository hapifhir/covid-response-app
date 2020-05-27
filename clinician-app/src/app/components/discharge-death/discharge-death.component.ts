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
  questions: any;
  loadData: boolean;
  idPac: string;
  
  
  constructor(private httpService: HttpService, private route: ActivatedRoute, private fhirOperations: FhirOperationsService) { }


  ngOnInit(): void {
      this.route.queryParamMap.subscribe(params => {
      this.idPac = this.route.snapshot.params.pacId;
   });
    console.log('patient:' + this.idPac);
    this.loadForm();
  }
  loadForm() {
    this.httpService.getResourceByQueryParam('Questionnaire', '?identifier=WHO_Module_3').then(res => {
      const resource = res['entry'][0].resource;
      this.questions = resource;
      this.loadData = true;
    }).catch(error => {
      console.log(Promise.reject(error));
    });
  }

  async submitQuestionnaire(formQuestions: any) {
    //get patient resources by id
    //http://localhost:8080/hapi-fhir-jpaserver/fhir/Patient?_id=2&_revinclude=EpisodeOfCare:patient
    this.httpService.getResourceByQueryParam('Patient', '?_id=' + this.idPac + '&_revinclude=EpisodeOfCare:patient').then( res => {
      var resource:FHIR.Bundle = <FHIR.Bundle>res;
      var patient:FHIR.Patient  = <FHIR.Patient>resource.entry[0].resource;
      var episode:FHIR.EpisodeOfCare  = <FHIR.EpisodeOfCare>resource.entry[1].resource;
       // create transaction bundle
      const transaction = new FHIR.Bundle();
      transaction.resourceType = 'Bundle';
      transaction.type = 'transaction';
      transaction.entry = [];
     
      const patient_temp_id =  'Patient/' + this.idPac;

      // update episode of care
      const eoc_temp_id = 'EpisodeOfCare/' + episode.id;
      const entry_two = new FHIR.Entry();
      entry_two.fullUrl = eoc_temp_id;
      //finish episode
      episode.status = 'finished';
      entry_two.resource = episode;

      const req_two = new FHIR.Request();
      req_two.method = 'PUT';
      req_two.url = 'EpisodeOfCare';

      entry_two.request = req_two;

      transaction.entry.push(entry_two);
      
      // create question response resource
      const questionnaireResponse = this.fhirOperations.generateQuestionnaireResponse(formQuestions,  this.questions, patient_temp_id, "WHO_Module_3_Questionnaire_Response");
      const entry_three = new FHIR.Entry();
      entry_three.resource = questionnaireResponse;

      const req_three = new FHIR.Request();
      req_three.method = 'POST';
      req_three.url = 'QuestionnaireResponse';

      entry_three.request = req_three;

      transaction.entry.push(entry_three);

      console.log('transaction', transaction);

      //post
      const transactionResponse =  this.httpService.postTransaction(transaction);
      console.log('transactionResponse', transactionResponse);


    }).catch(error => {
      console.log(Promise.reject(error));
    });


    
  }


}
