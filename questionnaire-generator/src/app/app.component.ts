import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { FormlyFormOptions, FormlyFieldConfig } from '@ngx-formly/core';
import { FormlyJsonschema } from '@ngx-formly/core/json-schema';
import { HttpClient } from '@angular/common/http';
import { tap } from 'rxjs/operators';
import { questionnaireR4Form } from './questionnaire-forms/questionnaire-r4';
import * as _moment from 'moment';
import { fhirR4 } from '@smile-cdr/fhirts';
import {MatDialog} from '@angular/material/dialog';
import { DialogComponent } from './dialog/dialog.component';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'questionnaireGenerator';
  form = new FormGroup({});
  model: any = {};
  options: FormlyFormOptions = {};
  fields: FormlyFieldConfig[] = questionnaireR4Form;

  constructor(
    private formlyJsonschema: FormlyJsonschema,
    private http: HttpClient,
    public dialog: MatDialog
    ) {
      this.options.formState = {};
      this.options.formState.mainModel = this.model;
  }


  submit() {
    const res = JSON.stringify(this.model, undefined, 2);
    this.dialog.open(DialogComponent, {
      data: {
        model: res
      }
    });
  }


}
