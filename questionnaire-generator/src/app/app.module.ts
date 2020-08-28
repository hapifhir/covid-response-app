import { BrowserModule } from "@angular/platform-browser";
import { NgModule } from "@angular/core";
import { ClarityModule } from "@clr/angular";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { R4Component } from './components/r4/r4.component';
import { Dstu3Component } from './components/dstu3/dstu3.component';
import { NavComponent } from './components/nav/nav.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [AppComponent, R4Component, Dstu3Component, NavComponent],
  imports: [BrowserModule, AppRoutingModule, ClarityModule, ReactiveFormsModule],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
