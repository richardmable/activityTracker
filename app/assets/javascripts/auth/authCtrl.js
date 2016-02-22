// this is the controller that will be used by the sign in and registration forms used by Devise

angular.module('activityTracker')

.controller('AuthCtrl', [
	'$scope',
	'$state',
	'Auth',
	// login and register functions that use methods on Auth
	// these return promises which we can use to redirect the user to the home state
	// if authentication or user registration is successful.
	function($scope, $state, Auth){
		// login method that uses Auth.login to say if successful, go to home page
		$scope.login = function(){
			Auth.login($scope.user).then(function(){
				// go to the home state
				$state.go('home');
			});
		};
		$scope.register = function(){
			Auth.register($scope.user).then(function(){
				$state.go('home');
			});
		};
}]);