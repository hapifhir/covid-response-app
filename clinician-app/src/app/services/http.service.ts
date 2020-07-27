import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class HttpService {

  constructor(private httpClient: HttpClient) { }

  getResourceByQueryParam(baseResource: string, queryParams: string) {
    return this.httpClient.get(environment.queryURI + '/' + baseResource + queryParams, {
      headers: this.getApiHeaders()
    }).toPromise();
  }

  postResource(resource) {
    return this.httpClient.post(environment.queryURI + '/' + resource.resourceType, resource, {
      headers: this.getApiHeaders()
    }).toPromise();
  }

  postTransaction(resource) {
    return this.httpClient.post(environment.queryURI, resource, {
      headers: this.getApiHeaders()
    }).toPromise();
  }

  getToken() {
    const tokenCredentials = {
      'username': 'democlinician',
      'password': 'a4PTL9kiq5Avxr'
    };
    return this.httpClient.post(environment.loginAPI,tokenCredentials, {
      headers: new HttpHeaders({
        'content-type': 'application/json'
      }),
    }).toPromise();
  }

  getApiHeaders(): HttpHeaders {
    const bearerToken = 'Bearer ' + sessionStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': bearerToken
    });
    return headers;
  }
}
