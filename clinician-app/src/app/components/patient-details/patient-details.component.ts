import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-patient-details',
  templateUrl: './patient-details.component.html',
  styleUrls: ['./patient-details.component.css']
})
export class PatientDetailsComponent implements OnInit {

  constructor(private route: ActivatedRoute, private httpService: HttpService,private router: Router) { }

  pacId;
  patientDetails;
  patientAssessments;
  patientEncounters;
  eocId;
  patStatus;

  ngOnInit(): void {
    this.pacId = this.route.snapshot.params.pacId;
    console.log ('pacID:'+ this.pacId);
    this.getPatientBundle();
  }
  
  async getPatientBundle() {
    const patientBundle = await this.httpService.getResourceByQueryParam('Patient', '?_id=' + this.pacId + '&_revinclude=*');
    this.patientDetails = patientBundle['entry'].filter(i => i.resource.resourceType === 'Patient')[0].resource;
    this.patientAssessments = patientBundle['entry'].filter(i => i.resource.resourceType === 'QuestionnaireResponse');
    this.patientEncounters = patientBundle['entry'].filter(i => i.resource.resourceType === 'Encounter');
    const eoc =  patientBundle['entry'].filter(i => i.resource.resourceType === 'EpisodeOfCare')[0].resource;
    this.eocId = eoc.id;
    this.patStatus = eoc.status;
  }

  getNameAssessment(nameId:string)
  {
    switch(nameId)
    {
      case "WHO_MODULE_1_Questionnaire_Response":
        return "Admit";
      case "WHO_Module_3_Questionnaire_Response":
        return "Discharge";
      case "WHO_MODULE_2_Questionnaire_Response":
        return "Daily";
    }
    
  }
  ViewAssessment(assessment:any)
  {
    switch (assessment.identifier.value)
    {
      case "WHO_MODULE_1_Questionnaire_Response":
        this.router.navigate(['/admit-patient', assessment.id]);
        break;
      case "WHO_Module_3_Questionnaire_Response":
        this.router.navigate(['/discharge-death',this.eocId],{ queryParams: { questId: assessment.id }}); 
        break;
      case "WHO_MODULE_2_Questionnaire_Response":
        this.router.navigate(['/daily-assessments',this.eocId],{ queryParams: { questId: assessment.id }}); 
        break;
    }
  }

}
