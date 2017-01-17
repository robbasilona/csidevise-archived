# up-csi x DevCon-Devise
Evacuation suggestor app

DevCon Devise 2016

UP CSI: Rob, Vince, Joseph, Sean

Before you proceed: make sure you already installed *rbenv* and *nvm*. Refer to our [stash](https://gitlab.com/up-csi/dev-resources/blob/master/learn_ruby_on_rails.md) if you didn't installed them yet and get resources for tutorials.

### Install Rails 5 and Ionic
```
rbenv install 2.3.0
gem install bundler
gem install rails
```

### RailsAPI Setup
```
git pull origin master
cd csidevise/railsapi
bundle install
sudo service postgresql start
sudo -su postgres psql #to start psql cli
CREATE ROLE csidevise WITH LOGIN CREATEDB PASSWORD 'csidevise';
\q #to quit psql
bundle exec rails db:create db:migrate db:seed
bundle exec rails s
```

### Ionic Setup
```
#no need to change working directory
nvm install stable
nvm use stable
npm install -g cordova ionic
cd csidevise/mobile
npm install
ionic serve
```

### Dummy login accounts
username:

password:

See *seeds.rb* for more details.

### Some API credentials
Google Maps API key
```
AIzaSyAnesP8EwTMBecjSmPBzeMp1hP3sG3IPgE
```
Chikka API
```
shortcode: 29290469148
clientID: f3be0f5b7d2abc0ce6fc0dccf7ecc049272af5679fbf5a547429cbaddb0391ff
secret: 757f94e11c41b07a8eb846c20ad1db7fcb98b07a57b85ebe7092c3e4c457f87b
```
