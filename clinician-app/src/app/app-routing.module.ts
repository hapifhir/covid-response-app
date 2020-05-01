import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AssessmentComponent } from './components/assessment/assessment.component';
import { QuestionnaireComponent } from './components/questionnaire/questionnaire.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';

const routes: Routes = [
  { path: '', component: DashboardComponent },
  { path: 'assessment', component: AssessmentComponent },
  { path: 'questionnaire/:id', component: QuestionnaireComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
