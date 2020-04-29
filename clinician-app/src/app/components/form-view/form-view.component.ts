import { Component, Input, OnInit  } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { QvScheme, ItemEntity, ItemGroupEntity } from './../../interfaces/qvscheme';



@Component({
  selector: 'app-form-view',
  templateUrl: './form-view.component.html',
  styleUrls: ['./form-view.component.css']
})
export class FormviewComponent implements OnInit {
  form: FormGroup;
  @Input() questions: QvScheme;
  consola = console;


  constructor() { }

  ngOnInit(): void {
    
    this.questions.item.forEach(question => {
      let group: any = {};
      let controls: any={};
      this.questions.item.forEach(question => {
        controls = {};
        question.item.forEach(ctrl2=>{
              if (ctrl2.required)
                controls[ctrl2.linkId] =  new FormControl(ctrl2.value,[Validators.required]);
              else
                controls[ctrl2.linkId] =  new FormControl(ctrl2.value);
        });
        group[question.linkId] =  new FormGroup (controls);        
      });
      this.form = new FormGroup(group);
    });
    
  }
  checkEnableWhen(itemGroup:ItemGroupEntity, item : ItemEntity)
    {
    var conditionvalue;
    var valid:boolean = false;
    //--no rules enablewhen
    if (item.enableWhen == undefined || item.enableWhen == null )
      return true;
    
    item.enableWhen?.forEach (rule=>{
      switch (rule.operator)
      {
        case "=":
          conditionvalue = this.form.get(itemGroup.linkId + '.' + rule.question).value || false;  
          valid = valid || (rule.answerCoding?.code == conditionvalue);
          valid = valid || (rule.answerBoolean?.valueOf == conditionvalue);
          break;
      }
    }); 

    if (!valid)
    {
      //this.form.get (itemGroup.linkId + '.' + item.linkId).reset();
    }
    return valid;

  }
  

}
