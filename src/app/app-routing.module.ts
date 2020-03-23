import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PatientQuestionnaireComponent } from './components/patient-questionnaire/patient-questionnaire.component';


const routes: Routes = [
  {path: '', component: PatientQuestionnaireComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
