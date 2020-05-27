import { Component, OnInit } from '@angular/core';
import { HttpService } from '../../services/http.service';
import * as moment from 'moment';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  patients = [];

  constructor(private httpService: HttpService, private router: Router) { }

  ngOnInit(): void {
    this.loadPatients();
  }

  loadPatients() {
    this.httpService.getResourceByQueryParam('Patient', '?_revinclude=EpisodeOfCare:patient').then(res => {
      const resources = res['entry'].map(item => item.resource);
      
      this.patients = resources.filter(item => item.resourceType === 'Patient').map(item => {
        const obj = {};
        obj['patId'] = item.id;
        if (item.name && item.name[0] && item.name[0].given) {
          obj['first_name'] = item.name[0].given.join(' ');
        }

        if (item.name && item.name[0] && item.name[0].family) {
          obj['last_name'] = item.name[0].family;
        }

        if (item.birthDate) {
          // date format from fhir YYYY-MM-DD
          obj['date_of_birth'] = item.birthDate;
        }

        const eoc = resources.filter(i => i.resourceType === 'EpisodeOfCare' && i.patient && i.patient.reference === (item.resourceType + '/' + item.id));

        if (eoc && Array.isArray(eoc) && eoc.length > 0) {
          // console.log(eoc);
          obj['episodeOfCareId'] = eoc[0].id;
          obj['status'] = eoc[0].status;
        }

        return obj;
      });
    }).catch(error => {
      console.log(error);
    });
  }

  routeTo(path) {
    // alert(path);
    this.router.navigate(['patient-details', path]);
  }

  calculateAge(dob) {
    return moment().diff(dob, 'years');
  }
}
