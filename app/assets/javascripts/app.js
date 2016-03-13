// injects ui-router, Angular templates, and ng-token-auth for authentication, and chartkick for angular 
angular.module('activityTracker', ['ui.router', 'templates', 'ng-token-auth', 'chart.js'])
// this is the Angular config function to setup a home state
.config([
	'$stateProvider',
	'$urlRouterProvider',
	'$authProvider',
	function($stateProvider, $urlRouterProvider, $authProvider) {
		$authProvider.configure({
			// set the path of the api (the Rails app)
			apiUrl: 'http://localhost:3000',
			// set the omniauth provider path 
			authProviderPaths: {
				strava: '/auth/strava'
			}
		});
		$stateProvider
			.state('/', {
				url: '/',
				templateUrl: 'landing/_landing.html',
				controller: 'LandingCtrl'
			})
			// the state is given a name
			.state('home', {
				// the state is given a url
				url: '/home',
				// and a template
				templateUrl: 'home/_home.html',
				// and should be controlled by MainCtrl
				controller: 'MainCtrl',
				// the resolve property ensures that anytime the home state is entered
				// it will automatically get the profile of the user
				// followers to get feed of stats they follow
				resolve: {
					profilePromise: ['profile', function(profile){
						return profile.getProfile();
					}],
					followingPromise: ['followers', function(followers){
						return followers.getFollowing();
					}]
				}
			})

			.state('fatigue', {
				url: '/fatigue',
				templateUrl: 'fatigue/_fatigues.html',
				controller: 'FatiguesCtrl',
				resolve: {
					fatiguesPromise: ['fatigues', function(fatigues){
						return fatigues.getFatigue();
					}] 
				}
			})

			.state('motion', {
				url: '/motion',
				templateUrl: 'motion/_motion.html',
				controller: 'MotionCtrl',
				resolve: {
					motionPromise: ['motion', function(motion){
						return motion.getMotion();
					}]
				}
			})

			.state('users', {
				url: '/users',
				templateUrl: 'user/_userList.html',
				controller: 'UserCtrl',
				resolve: {
					usersPromise: ['users', function(users){
						return users.getUsers();
					}]
				}
			})

			.state('follow', {
				url: '/follow',
				templateUrl: 'followers/_follow.html',
				controller: 'FollowersCtrl',
				resolve: {
					followersPromise: ['followers', function(followers){
						return followers.getFollowers();
					}],
					followingPromise: ['followers', function(followers){
						return followers.getFollowing();
					}]
				}
			})

		// otherwise() redirects to unspecified routes
		$urlRouterProvider.otherwise('/');
}]);
