import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, ValidatorFn, FormBuilder } from '@angular/forms';
import { FhirOperationsService } from './../../services/fhir-operations.service';
import { HttpService } from './../../services/http.service';

@Component({
  selector: 'app-assessment',
  templateUrl: './assessment.component.html',
  styleUrls: ['./assessment.component.css']
})
export class AssessmentComponent implements OnInit {

  constructor() { }
  
  ngOnInit(): void {
    
  }

}
