import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AssessmentComponent } from './components/assessment/assessment.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { AdmitpatientComponent } from './components/admit-patient/admit-patient.component';

const routes: Routes = [
  { path: '', component: DashboardComponent },
  { path: 'assessment', component: AssessmentComponent },
  { path: 'admit-patient', component:AdmitpatientComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
