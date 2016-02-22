// injects ui-router, Angular templates, and Devise into our Angular app
angular.module('activityTracker', ['ui.router', 'templates', 'Devise', 'ng-token-auth'])
// this is the Angular config function to setup a home state
.config([
	'$stateProvider',
	'$urlRouterProvider',
	'$authProvider',
	function($stateProvider, $urlRouterProvider, $authProvider) {
		$authProvider.confgure({
			apiUrl: 'https://www.strava.com/api/v3/athlete/'
		});
		$stateProvider
			// the state is given a name
			.state('home', {
				// the state is given a url
				url: '/home',
				// and a template
				templateUrl: 'home/_home.html',
				// and should be controlled by MainCtrl
				controller: 'MainCtrl'
				// the resolve property ensures that anytime the home state is entered
				// it will automatically query all posts from the back end before the state is loaded
				// resolve: {
				// 	postPromise: ['posts', function(posts){
				// 		return posts.getAll();
				// 	}] 
				// }

			})

			// the login state
			.state('login', {
				url: '/login',
				templateUrl: 'auth/_login.html',
				controller: 'AuthCtrl',
				// this is an onEnter callback that will send the user to the home state
				// if they are already authenticated or just registered
				// have to inject $state and Auth
				onEnter: ['$state', 'Auth', function($state, Auth){
					Auth.currentUser().then(function(){
						$state.go('home');
					})
				}]
			})

		// otherwise() redirects to unspecified routes
		$urlRouterProvider.otherwise('home');
}]);
