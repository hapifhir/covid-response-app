import { Component, OnInit } from '@angular/core';
import moment from 'moment';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  // date format from fhir YYYY-MM-DD
  patients = [
    { first_name: 'Mohammad', last_name: 'Farooqi', date_of_birth: '1970-03-31', },
    { first_name: 'Aditya', last_name: 'Dave', date_of_birth: '1980-07-20', }
  ];

  constructor() { }

  ngOnInit(): void {
  }

  calculateAge(dob) {
    return moment().diff(dob, 'years');
  }
}
