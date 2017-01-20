import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';
import { Validators, FormBuilder } from '@angular/forms';
import { SMS } from 'ionic-native';
/*
Generated class for the Sms page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-sms',
  templateUrl: 'sms.html'
})
export class SmsPage {
  textfield: any;
  constructor(public navCtrl: NavController, public navParams: NavParams, private formBuilder: FormBuilder) {
    this.textfield = this.formBuilder.group({
      textfielder: ['', Validators.required]
    });
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad SmsPage');
  }

  logForm(){
    console.log(this.textfield.value);
  }

  sendSMS(){
    SMS.send('29290469148', this.textfield.value);
  }
}
