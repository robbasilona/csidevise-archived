angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    
  

      .state('tabsController.resource', {
    url: '/page2',
    views: {
      'tab1': {
        templateUrl: 'templates/resource.html',
        controller: 'resourceCtrl'
      }
    }
  })

  .state('tabsController.evacuate', {
    url: '/page3',
    views: {
      'tab2': {
        templateUrl: 'templates/evacuate.html',
        controller: 'evacuateCtrl'
      }
    }
  })

  .state('tabsController.trends', {
    url: '/page4',
    views: {
      'tab3': {
        templateUrl: 'templates/trends.html',
        controller: 'trendsCtrl'
      }
    }
  })

  .state('tabsController', {
    url: '/page2',
    templateUrl: 'templates/tabsController.html',
    abstract:true
  })

$urlRouterProvider.otherwise('/page2/page2')

  

});