import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Questionnaire, QuestionnaireItem, QuestionnaireItemGroup } from './../../interfaces/FHIR';
import {ChangeDetectorRef} from '@angular/core';


@Component({
  selector: 'app-form-view',
  templateUrl: './form-view.component.html',
  styleUrls: ['./form-view.component.css']
})
export class FormviewComponent implements OnInit {
  form: FormGroup;
  @Input() questions: Questionnaire;
  @Output() submitEvent: EventEmitter<Questionnaire> = new EventEmitter();
  

  constructor(private cdref: ChangeDetectorRef) { }

  ngOnInit(): void {
      let group: any = {};
      let controls: any = {};
      this.questions.item.forEach(question => {
        controls = {};
        question.item.forEach(ctrl2 => {
         if (ctrl2.required)
          {
            controls[ctrl2.linkId] = new FormControl(ctrl2.value, [Validators.required]);
          }
         else
            controls[ctrl2.linkId] = new FormControl(ctrl2.value);
        });
        group[question.linkId] = new FormGroup(controls);
      });
      this.form = new FormGroup(group);
  }
  checkEnableWhen(item: QuestionnaireItem)
  {
    return  !(item.enableWhen === undefined || item.enableWhen === null);
  }
  isEnableWhen(itemGroup: QuestionnaireItemGroup, item: QuestionnaireItem) {

    var conditionvalue;
    var value:string;
    var valid: boolean = false;
    //--no rules enablewhen
    if (item.enableWhen === undefined || item.enableWhen === null) {
      return true;
    } else {
      item.enableWhen?.forEach(rule => {
        switch (rule.operator) {
          case "=":
            conditionvalue = this.form.get(itemGroup.linkId + '.' + rule.question).value || false;
            valid = valid || (rule.answerCoding?.code === conditionvalue);
            valid = valid || (rule.answerBoolean?.valueOf === conditionvalue);
            break;
          case "exists":
            value =  this.form.get(itemGroup.linkId + '.' + rule.question).value || "";
            conditionvalue = (value != undefined && value != null && value !='')
            
            
            valid = valid || (rule.answerBoolean === conditionvalue);
            console.log ("y" + valid);
          break;

        }
       
      });
      
    }

 /*    if (!valid) {
     // setTimeout(() => {
      /* this.form.get(itemGroup.linkId + '.' + item.linkId).reset();
      this.form.get(itemGroup.linkId + '.' + item.linkId).clearValidators();
      this.form.get(itemGroup.linkId + '.' + item.linkId).updateValueAndValidity(); 
    //});

    }else {
      if (item.required)
        this.form.get(itemGroup.linkId + '.' + item.linkId).setValidators(Validators.required);
    }  */
    return valid;

  }

  submitForm()
  {
    if (!this.form.invalid) {
      const formValues = this.form.value;
      this.submitEvent.emit(formValues);
    }
  
  }
  

}
