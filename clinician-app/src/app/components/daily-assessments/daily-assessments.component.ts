import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-daily-assessments',
  templateUrl: './daily-assessments.component.html',
  styleUrls: ['./daily-assessments.component.css']
})
export class DailyAssessmentsComponent implements OnInit {

  constructor(private httpService: HttpService) { }

  questions: any;
  loadData: boolean;

  ngOnInit(): void {
    this.loadForm();
  }

  loadForm() {
    this.httpService.getResourceByQueryParam('Questionnaire', '?identifier=WHO_Module_2').then(res => {
      const resource = res['entry'][0].resource;
      this.questions = resource;
      this.loadData = true;
    }).catch(error => {
      console.log(Promise.reject(error));
    });
  }

  submitQuestionnaire(formQuestions: any) {
    console.log(formQuestions);
  }

}
