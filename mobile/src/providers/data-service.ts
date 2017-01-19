import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

/*
  Generated class for the DataService provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular 2 DI.
*/
@Injectable()
export class DataService {

  constructor(public http: Http) {
    console.log('Hello DataService Provider');
  }

  loadPins(id){
    return new Promise(resolve => {
      let url = 'http://localhost:3000/pins';
      if (id) {
        url += '/' + id;
      }
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
        });
    });
  }

  loadSupplies(id){
    return new Promise(resolve => {
      let url = 'http://localhost:3000/supplies';
      if (id) {
        url += '/' + id;
      }
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
        });
    });
  }

  loadSupplyPins(sid){
    return new Promise(resolve => {
      let url = 'http://localhost:3000/supplies/' + sid + '/pins';
      console.log(url);
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
        });
    });
  }

  loadCenters(id){
    return new Promise(resolve => {
      let url = 'http://localhost:3000/evac_centers';
      if (id) {
        url += '/' + id;
      }
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
        });
    });
  }

}
