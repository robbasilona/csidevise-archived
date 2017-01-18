import { Component, ViewChild, ElementRef } from '@angular/core';

import { NavController } from 'ionic-angular';

import { Geolocation } from 'ionic-native';

import { DataService } from '../../providers/data-service';

declare var google;

@Component({
  selector: 'page-home',
  templateUrl: 'home.html',
  providers: [DataService]
})
export class HomePage {
  @ViewChild('map') mapElement: ElementRef;
  map: any;
  geocoder: any;

  public biscuit: Boolean;
  public water: Boolean;
  public goods: Boolean;
  public batteries: Boolean;
  lat: number;
  lon: number;
  loc: string;
  icons = ['http://maps.google.com/mapfiles/ms/icons/red-dot.png', 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png', 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'];
  pins: Array<any>;
  supplies: Array<any>;
  markers: Array<any>;
  windows: Array<any>;

  constructor(public navCtrl: NavController, public api: DataService) {
    this.biscuit = true;
    this.water = false;
    this.goods = true;
    this.batteries = false;
    this.api.loadPins(0).then(data => {
      this.pins = data;
    });
    this.api.loadSupplies(0).then(data => {
      this.supplies = data;
      for (let supply of this.supplies) {
        supply.enabled = false;
      }
    });
  }

  ionViewDidLoad(){
    this.loadMap();
    // this.displayPins();
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
      this.addHomeInfo();
      for (let pin of this.pins) {
        this.addMarkerInfo(pin);
      }
    }, (err) => {
      console.log(err);
    });
  }

  addHomeInfo(){
    let icon = {
      url: this.icons[2], // url
      scaledSize: new google.maps.Size(20, 24), // scaled size
      origin: new google.maps.Point(0,0), // origin
      anchor: new google.maps.Point(0, 0) // anchor
    };
    let marker = new google.maps.Marker({
      map: this.map,
      animation: google.maps.Animation.DROP,
      position: this.map.getCenter(),
      icon: icon
    });
    let content = "Current Location";
    let infoWindow = new google.maps.InfoWindow({
      content: content
    });
    google.maps.event.addListener(marker, 'click', () => {
      infoWindow.open(this.map, marker);
    });
  }

  displayPins(){
    //reset map
    for (let marker of this.markers) {
      console.log(marker);
      marker.setMap(null);
    }
    for (let window of this.windows) {
      window.close();
    }
    this.pins = new Array<any>();
    this.markers = new Array<any>();
    this.windows = new Array<any>();

    //get enabled supplies
    for (let supply of this.supplies) {
      if (supply.enabled) {
        console.log('yes');
        this.api.loadSupplyPins(supply.id).then(data => {
          this.pins = this.pins.concat(data);
        });
      }
    }
    for (let pin of this.pins) {
      this.addMarkerInfo(pin);
    }
  }

  addMarkerInfo(pin){
    let icon = {
      url: this.icons[0], // url
      scaledSize: new google.maps.Size(20, 24), // scaled size
      origin: new google.maps.Point(0,0), // origin
      anchor: new google.maps.Point(0, 0) // anchor
    };
    let marker = new google.maps.Marker({
      map: this.map,
      animation: google.maps.Animation.FADE,
      position: new google.maps.LatLng(pin.latitude, pin.longitude),
      icon: icon
    });
    this.markers += marker;
    let content = pin.name + "<br><i>" + pin.classification + "</i>";
    let infoWindow = new google.maps.InfoWindow({
      content: content
    });
    this.windows += infoWindow;
    google.maps.event.addListener(marker, 'click', () => {
      infoWindow.open(this.map, marker);
    });
  }
}
