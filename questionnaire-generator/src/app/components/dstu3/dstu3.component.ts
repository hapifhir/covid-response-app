import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms'; 

@Component({
  selector: 'app-dstu3',
  templateUrl: './dstu3.component.html',
  styleUrls: ['./dstu3.component.scss']
})
export class Dstu3Component implements OnInit {
  constructor() { }

  questionnaireForm = new FormGroup({
    url: new FormControl(''),
    version: new FormControl(''),
    name: new FormControl(''),
    title: new FormControl(''),
    status: new FormControl(''),
    experimental: new FormControl(''),
    date: new FormControl(''),
    publisher: new FormControl(''),
    description: new FormControl(''),
    purpose: new FormControl(''),
    approvalDate: new FormControl(''),
    lastReviewDate: new FormControl('')
  })

  ngOnInit(): void {
  }

}
