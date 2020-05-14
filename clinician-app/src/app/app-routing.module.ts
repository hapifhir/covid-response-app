import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { AdmitpatientComponent } from './components/admit-patient/admit-patient.component';
import { LoginComponent } from './components/login/login.component';

const routes: Routes = [
  {path: '', component: DashboardComponent},
  {path: 'admit-patient', component: AdmitpatientComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
