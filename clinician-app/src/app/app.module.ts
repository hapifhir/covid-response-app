import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { ClarityModule } from "@clr/angular";
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { TranslateModule, TranslateLoader } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { AssessmentComponent } from './components/assessment/assessment.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { FormviewComponent } from './components/form-view/form-view.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FhirOperationsService } from './services/fhir-operations.service';
import { UtilService } from './services/util.service';
import { HttpService } from './services/http.service';
import { AdmitpatientComponent } from './components/admit-patient/admit-patient.component';

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/');
}

@NgModule({
  declarations: [
    AppComponent,
    AssessmentComponent,
    NavbarComponent,
    FormviewComponent,
    AdmitpatientComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    ClarityModule,
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    })
  ],
  providers: [FhirOperationsService, UtilService, HttpService],
  bootstrap: [AppComponent]
})
export class AppModule { }
