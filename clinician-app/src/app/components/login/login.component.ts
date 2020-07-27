import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private router: Router, private httpService: HttpService) { }

  loginForm = new FormGroup({
    username: new FormControl('democlinician', Validators.required),
    password: new FormControl('practitioner1', Validators.required)
  });
  ngOnInit(): void {
  }

  onSubmit() {
    if(this.loginForm.valid) {
      const usernameEntered = this.loginForm.value.username;
      const passwordEntered = this.loginForm.value.password;
      // Placeholder login, will need integration enhancements 
      if((usernameEntered.toLowerCase() === 'democlinician' && passwordEntered === 'practitioner1'))  {
        sessionStorage.setItem('userLogged', usernameEntered);
        this.setLoginParams();
        setTimeout(() => {
          this.router.navigate(['dashboard'])
        }, 1000);
      } else {
        this.loginForm.reset();
      }
    }
  }

  async setLoginParams() {
    const token = await this.httpService.getToken();
    sessionStorage.setItem('token', token['token']);
  }
}
