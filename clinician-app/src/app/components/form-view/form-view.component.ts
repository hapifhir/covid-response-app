import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { QvScheme, ItemEntity, ItemGroupEntity } from './../../interfaces/qvscheme';
import {ChangeDetectorRef} from '@angular/core';


@Component({
  selector: 'app-form-view',
  templateUrl: './form-view.component.html',
  styleUrls: ['./form-view.component.css']
})
export class FormviewComponent implements OnInit {
  form: FormGroup;
  @Input() questions: QvScheme;
  @Output() submitEvent: EventEmitter<QvScheme> = new EventEmitter();
  

  constructor(private cdref: ChangeDetectorRef) { }

  ngOnInit(): void {

      console.log (this.questions);
      let group: any = {};
      let controls: any = {};
      this.questions.item.forEach(question => {
        controls = {};
        question.item.forEach(ctrl2 => {
         if (ctrl2.required)
            controls[ctrl2.linkId] = new FormControl(ctrl2.value, [Validators.required]);
         else
            controls[ctrl2.linkId] = new FormControl(ctrl2.value);
        });
        group[question.linkId] = new FormGroup(controls);
      });
      this.form = new FormGroup(group);

  }
  checkEnableWhen(item: ItemEntity)
  {
    return  !(item.enableWhen === undefined || item.enableWhen === null);
  }
  isEnableWhen(itemGroup: ItemGroupEntity, item: ItemEntity) {

    var conditionvalue;
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
