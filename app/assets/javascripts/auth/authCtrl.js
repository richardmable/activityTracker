// this is the controller that will be used by the sign in and registration forms used by Devise

angular.module('activityTracker')

.controller('AuthCtrl', [
	'$scope',
	'$state',
	'$auth',
	// methods for logging in using omniauth with ng-token-auth
	function($scope, $state, $auth){
		$scope.handleBtnClick= function(){
			$auth.authenticate('strava');
			}	
			// // handle success
			// .then(function(resp){
			// 	console.log('logged in')
			// 	// redirect to home on successful login
			// 	$state.go('home')
			// })
			// // handle errors
			// .catch(function(resp){
			// 	$state.go('login')
			// 	// add an error message
			// });
		
		
}]);