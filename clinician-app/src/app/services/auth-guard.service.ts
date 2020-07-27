import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService implements CanActivate {

  // placeholder auth guard
  constructor(public router: Router) { }

  canActivate(): boolean {
    let authorized;
    if(sessionStorage.getItem('userLogged')) {
      authorized = true;
    } else {
      this.router.navigate(['']);
      authorized = false;
    }
    return authorized;
  }
}
