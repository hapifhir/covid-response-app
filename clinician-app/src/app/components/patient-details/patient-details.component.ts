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
  eocId;
  patientDetails;

  ngOnInit(): void {
    this.eocId = this.route.snapshot.params.eocId;
    this.getPatientBundle();
  }

  async getPatientBundle() {
    const patientBundle = await this.httpService.getResourceByQueryParam('EpisodeOfCare', '?_id=' + this.eocId + '&_include=*');
    this.patientDetails = patientBundle['entry'].filter(i => i.resource.resourceType === 'Patient')[0].resource;
  }

  

}
