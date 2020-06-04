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

  ngOnInit(): void {
    this.pacId = this.route.snapshot.params.pacId;
    console.log ('pacID:'+ this.pacId);
    this.getPatientBundle();
    //assesment
    
  }
  
  async getPatientBundle() {
    const patientBundle = await this.httpService.getResourceByQueryParam('Patient', '?_id=' + this.pacId + '&_revinclude=*');
    this.patientDetails = patientBundle['entry'].filter(i => i.resource.resourceType === 'Patient')[0].resource;
    this.patientAssessments = patientBundle['entry'].filter(i => i.resource.resourceType === 'QuestionnaireResponse');
    //load encounters
    const  episodeBundle = await this.httpService.getResourceByQueryParam('EpisodeOfCare','?patient=' + this.pacId + '&_revinclude=*');
    this.patientEncounters = episodeBundle['entry'].filter(i => i.resource.resourceType === 'Encounter')
    console.log(this.patientEncounters[0]);
  }
 

 
}
