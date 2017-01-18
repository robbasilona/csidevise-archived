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
  data: any;

  constructor(public http: Http) {
    console.log('Hello DataService Provider');
  }

  loadPins(id){
    if(this.data){
      return Promise.resolve(this.data);
    }
    return new Promise(resolve => {
      let url = 'http://localhost:3000/pins';
      if (id) {
        url += '/' + id;
      }
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          this.data = data;
          resolve(this.data);
        });
    });
  }

  loadSupplies(id){
    if(this.data){
      return Promise.resolve(this.data);
    }
    return new Promise(resolve => {
      let url = 'http://localhost:3000/supplies';
      if (id) {
        url += '/' + id;
      }
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          this.data = data;
          resolve(this.data);
        });
    });
  }

  loadSupplyPins(sid){
    if(this.data){
      return Promise.resolve(this.data);
    }
    return new Promise(resolve => {
      let url = 'http://localhost:3000/supplies/' + sid + '/pins';
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          this.data = data;
          resolve(this.data);
        });
    });
  }

  loadCenters(id){
    if(this.data){
      return Promise.resolve(this.data);
    }
    return new Promise(resolve => {
      let url = 'http://localhost:3000/evac_centers';
      if (id) {
        url += '/' + id;
      }
      this.http.get(url)
        .map(res => res.json())
        .subscribe(data => {
          this.data = data;
          resolve(this.data);
        });
    });
  }

}
