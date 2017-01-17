import { Component } from '@angular/core';

import { NavController } from 'ionic-angular';

import { Geolocation } from 'ionic-native';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  public biscuit: Boolean;
  public water: Boolean;
  public goods: Boolean;
  public batteries: Boolean;
  public lat: Number;
  public lon: Number;

  constructor(public navCtrl: NavController) {
    this.biscuit = true;
    this.water = false;
    this.goods = true;
    this.batteries = false;
    this.geolocate();
  }

  geolocate(){
    Geolocation.getCurrentPosition().then((resp) => {
      this.lat = resp.coords.latitude;
      this.lon = resp.coords.longitude;
    }).catch((error) => {
      console.log('Error getting location', error);
    });
  }

}
