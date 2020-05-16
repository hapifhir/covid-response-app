import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private router: Router) { }

  loginForm = new FormGroup({
    username: new FormControl('', Validators.required),
    password: new FormControl('', Validators.required)
  });
  ngOnInit(): void {
  }

  onSubmit() {
    if(this.loginForm.valid) {
      const usernameEntered = this.loginForm.value.username;
      const passwordEntered = this.loginForm.value.password;
      // Placeholder login, will need integration enhancements 
      if((usernameEntered.toLowerCase() === 'roy' && passwordEntered === 'practitioner1') ||
      (usernameEntered.toLowerCase() === 'olivia' && passwordEntered === 'practitioner2'))  {
        sessionStorage.setItem('userLogged', usernameEntered);
        this.router.navigate(['dashboard']);
      } else {
        this.loginForm.reset();
      }
    }
  }
}
