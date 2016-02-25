// this is the controller that will be used by the sign in and registration forms used by Devise

angular.module('activityTracker')

.controller('AuthCtrl', [
	'$scope',
	'$state',
	'$auth',

	// methods for logging in using omniauth with ng-token-auth
	function($scope, $state, $auth, $rootScope){
		$scope.loginUser = function(){
			$auth.authenticate('strava')
		}

}]);