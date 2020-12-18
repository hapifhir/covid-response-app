import {
    Component,
    ChangeDetectionStrategy,
    ViewChild,
    AfterViewInit,
    TemplateRef
} from '@angular/core';
import { FieldType } from '@ngx-formly/material/form-field';

@Component({
    selector: 'formly-date-time-picker',
    template: `
    <input
            matInput
            [ngxMatDatetimePicker]="picker"
            placeholder="Choose a date"
            [formControl]="formControl"
            [formlyAttributes]="field"
            class="date-picker-formly"
        />
        <mat-datepicker-toggle [for]="picker"></mat-datepicker-toggle>
        <ngx-mat-datetime-picker
            #picker
            [enableMeridian]="true"
        >
        </ngx-mat-datetime-picker>
    `,
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class FormlyDateTimePicker extends FieldType { }

