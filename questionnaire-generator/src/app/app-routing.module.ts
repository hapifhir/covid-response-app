import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { R4Component } from './components/r4/r4.component';
import { Dstu3Component } from './components/dstu3/dstu3.component';


const routes: Routes = [
  { path: 'r4', component: R4Component },
  { path: 'dstu3', component: Dstu3Component },
  { path: '**', redirectTo: '/r4' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }