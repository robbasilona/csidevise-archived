import { Component } from '@angular/core';
import { NavController, NavParams} from 'ionic-angular';
import { TabsPage } from '../tabs/tabs';
import { SmsPage } from '../sms/sms';
import { InfoPage } from '../info/info';

import { InAppBrowser } from 'ionic-native';

/*
  Generated class for the Splash page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-splash',
  templateUrl: 'splash.html'
})
export class SplashPage {

  constructor(public navCtrl: NavController, public navParams: NavParams) {}

  goTo(){
    this.navCtrl.push(TabsPage);
  }

  goToText(){
    this.navCtrl.push(SmsPage);
  }

  goToInfo(){
    this.navCtrl.push(InfoPage);
  }

  goToMsgr(){
    let browser = new InAppBrowser('http://fb.com/msg/refugeo','_system');
    browser.show();
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad SplashPage');
  }

}
