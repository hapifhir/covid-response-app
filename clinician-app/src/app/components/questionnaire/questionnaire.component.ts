import { Component, OnInit, Input} from '@angular/core';
import { HttpService } from '../../services/http.service';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { QvScheme } from '../../interfaces/qvscheme';


@Component({
  selector: 'app-questionnaire',
  templateUrl: './questionnaire.component.html',
  styleUrls: ['./questionnaire.component.css']
})
export class QuestionnaireComponent implements OnInit {
  @Input() idresource: string;
  questions: any;
  loadData:boolean;
  

  constructor( private httpService: HttpService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.idresource = this.route.snapshot.paramMap.get('id');
    this.loadForm(this.idresource);
    // this.httpService.getResourceByQueryParam(environment.questionnariRes, '?identifier=WHO_Module_1').then(res => {
    //   const resource = res['entry'][0];
    //   console.log(resource);
    //   // WHO_MODULE_1 === Admit Patient 
    // })
  }
  
  loadForm(id:string)
  {
    this.httpService.getResourceByQueryParam(environment.questionnariRes + '/' + this.idresource,'').then(r => {
      this.questions = r;
      this.loadData = true;
    }).catch(error => {
      console.log (Promise.reject(error));
    });
  }



}
