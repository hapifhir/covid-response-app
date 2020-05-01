import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AssessmentComponent } from './components/assessment/assessment.component';
import { AdmitpatientComponent } from './components/admit-patient/admit-patient.component';

const routes: Routes = [
  {path: '', component: AssessmentComponent},
  {path: 'admit-patient', component:AdmitpatientComponent }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
