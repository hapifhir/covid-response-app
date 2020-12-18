import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ReactiveFormsModule } from '@angular/forms';
import { FormlyModule } from '@ngx-formly/core';
import { FormlyMaterialModule } from '@ngx-formly/material';
import { HttpClientModule } from '@angular/common/http';
import { MatGridListModule } from '@angular/material/grid-list'; 
import { MatToolbarModule } from '@angular/material/toolbar'; 
import { MatExpansionModule } from '@angular/material/expansion'
import { MatButtonModule } from '@angular/material/button'; 
import { MatIconModule } from '@angular/material/icon'; 
import { MatNativeDateModule } from '@angular/material/core';
import { MatDatepickerModule } from '@angular/material/datepicker'; 
import { MatFormFieldModule } from '@angular/material/form-field'; 
import { NgxMatMomentModule } from '@angular-material-components/moment-adapter';
import { FormlyMatDatepickerModule } from '@ngx-formly/material/datepicker';
import { NgxMatDatetimePickerModule, NgxMatTimepickerModule } from '@angular-material-components/datetime-picker';
import { ObjectTypeComponent } from './formly-types/object.type';
import { ArrayTypeComponent } from './formly-types/array.type';
import { FormlyDateTimePicker } from './formly-types/date-time-picker';
import { MatDialogModule } from '@angular/material/dialog'; 
import { DialogComponent } from './dialog/dialog.component';

@NgModule({
  declarations: [
    AppComponent,
    ObjectTypeComponent,
    ArrayTypeComponent,
    FormlyDateTimePicker,
    DialogComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    MatNativeDateModule,
    HttpClientModule,
    MatFormFieldModule,
    MatGridListModule,
    MatToolbarModule,
    MatExpansionModule,
    MatButtonModule,
    MatIconModule,
    MatDatepickerModule,
    MatDialogModule,
    NgxMatDatetimePickerModule,
    NgxMatTimepickerModule,
    NgxMatMomentModule,
    FormlyMaterialModule,
    FormlyMatDatepickerModule,
    FormlyModule.forRoot({ 
      extras: { 
        lazyRender: true,
        resetFieldOnHide: true 
      },
      types: [
        { name: 'object', component: ObjectTypeComponent},
        { name: 'array', component: ArrayTypeComponent},
        {
          name: 'date-time-picker',
          component: FormlyDateTimePicker,
          wrappers: ['form-field'],
          defaultOptions: {
            defaultValue: new Date(),
            templateOptions: {
              datepickerOptions: {},
            },
          },
        }
      ]
     })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
