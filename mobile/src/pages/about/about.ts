import { Component, ViewChild, ElementRef } from '@angular/core';

import { NavController } from 'ionic-angular';

import { Geolocation } from 'ionic-native';

import { DataService } from '../../providers/data-service';

declare var google;

@Component({
  selector: 'page-about',
  templateUrl: 'about.html',
  providers: [DataService]
})
export class AboutPage {
  @ViewChild('map1') mapElement: ElementRef;
  map: any;
  geocoder: any;

  loc: string;
  lat: number;
  lon: number;
  pins: any;

  constructor(public navCtrl: NavController, public api: DataService) {
    this.api.loadCenters(0).then(data => {
      this.pins = data;
    });
  }

  ionViewDidLoad(){
    this.loadMap();
  }

  loadMap(){
    Geolocation.getCurrentPosition().then((position) => {
      this.lat = position.coords.latitude;
      this.lon = position.coords.longitude;
      let latLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      let mapOptions = {
        center: latLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true
      }
      this.map = new google.maps.Map(this.mapElement.nativeElement, mapOptions);
      this.geocoder = new google.maps.Geocoder;
      this.addHomeInfo();
      this.reverseGeo();
      for (let pin of this.pins) {
        this.addMarkerInfo(pin);
      }
    }, (err) => {
      console.log(err);
    });
  }

  addHomeInfo(){
    let marker = new google.maps.Marker({
      map: this.map,
      animation: google.maps.Animation.DROP,
      position: this.map.getCenter()
    });
    let content = "Current Location";
    let infoWindow = new google.maps.InfoWindow({
      content: content
    });
    google.maps.event.addListener(marker, 'click', () => {
      infoWindow.open(this.map, marker);
    });
  }

  goToCenter(){
    console.log('clicked center');
    this.map.panTo(new google.maps.LatLng(this.lat, this.lon));
  }

  addMarkerInfo(pin){
    let marker = new google.maps.Marker({
      map: this.map,
      animation: google.maps.Animation.FADE,
      position: new google.maps.LatLng(pin.latitude, pin.longitude)
    });
    let content = pin.name + "<br><i>" + pin.classification + "</i>";
    let infoWindow = new google.maps.InfoWindow({
      content: content
    });
    google.maps.event.addListener(marker, 'click', () => {
      infoWindow.open(this.map, marker);
    });
  }

  reverseGeo(){
    let latlng = {lat: this.lat, lng: this.lon};
    this.geocoder.geocode({'location': latlng}, (results, status) => {
      if (status === 'OK') {
        this.loc = results[0].formatted_address;
      } else {
        console.log('Geocoder failed due to ', status);
      }
    });
  }
}
