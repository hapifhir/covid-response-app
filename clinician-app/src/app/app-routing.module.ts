import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { AdmitpatientComponent } from './components/admit-patient/admit-patient.component';
import { DischargeDeathComponent } from './components/discharge-death/discharge-death.component';
import { LoginComponent } from './components/login/login.component';
import { AuthGuardService } from './services/auth-guard.service';
import { PatientDetailsComponent } from './components/patient-details/patient-details.component';
import { DailyAssessmentsComponent } from './components/daily-assessments/daily-assessments.component';

const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuardService] },
  { path: 'admit-patient', component: AdmitpatientComponent, canActivate: [AuthGuardService] },
  { path: 'admit-patient/:questId', component: AdmitpatientComponent, canActivate: [AuthGuardService] },
  { path: 'patient-details/:pacId', component: PatientDetailsComponent, canActivate: [AuthGuardService] },
  { path: 'daily-assessments/:eocId', component: DailyAssessmentsComponent, canActivate: [AuthGuardService] },
  {path: 'discharge-death/:eocId', component: DischargeDeathComponent, canActivate: [AuthGuardService] }
 
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
