import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class HttpService {

  constructor(private httpClient: HttpClient) { }

  getResourceByQueryParam(baseResource: string, queryParams: string) {
    return this.httpClient.get(environment.queryURI + '/' + baseResource + queryParams).toPromise();
  }

  postResource(resource) {
    return this.httpClient.post(environment.queryURI + '/' + resource.resourceType, resource).toPromise();
  }

  postTransaction(resource) {
    return this.httpClient.post(environment.queryURI, resource).toPromise();
  }
}
