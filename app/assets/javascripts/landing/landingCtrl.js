// this is the controller that will be used by the sign in and registration forms used by Devise

angular.module('activityTracker')

.controller('LandingCtrl', [
	'$scope',
	'$state',
	'$auth',

	// methods for logging in using omniauth with ng-token-auth
	function($scope, $state, $auth){
		$scope.loginUser = function(){
			$auth.authenticate('strava');
			$state.go('home');
		};
		$scope.logoSrc = '<%= asset_path("LogInWithStrava.png") %>';
		// document.onload =  function(){
		// document.getElementById("loginButton").onClick(function(){
		// 	$state.go('home');
		// })};

}]);