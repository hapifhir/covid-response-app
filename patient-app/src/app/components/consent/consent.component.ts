import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-consent',
  templateUrl: './consent.component.html',
  styleUrls: ['./consent.component.css']
})
export class ConsentComponent implements OnInit {

  constructor(private cookieService: CookieService) { }

  ngOnInit(): void {
  }

  consentAgree() {
    this.cookieService.set('consentPage', 'yes', 1);
    this.cookieService.set('consentGiven', 'yes', 1);
  }

  consentDecline() {
    this.cookieService.set('consentPage', 'yes', 1);
    this.cookieService.set('consentGiven', 'no', 1);
  }

}
