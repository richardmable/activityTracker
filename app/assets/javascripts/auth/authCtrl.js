// this is the controller that will be used by the sign in and registration forms used by Devise

angular.module('activityTracker')

.controller('AuthCtrl', [
	'$scope',
	'$state',
	'$auth',
	'$rootScope',

	// methods for logging in using omniauth with ng-token-auth
	function($scope, $state, $auth, $rootScope){
		$scope.loginUser = function(){
			$auth.authenticate('strava')
		}
		// this doesn't seem to be running, possibly because $auth.authenticate skips this controller
		$rootScope.$on('auth:login-success', function(ev, user) {
    		alert('Welcome ', user.email);
		});

}]);