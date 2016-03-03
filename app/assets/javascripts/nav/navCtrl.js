// controller for the navigation bar
angular.module('activityTracker')

.controller('NavCtrl', [
	'$scope',
	'$state',
	function($scope, $state){
		// function to log user out
		$scope.handleSignOutBtnClick = function(){
			$auth.signOut();
			$state.go('home');
		}

}]);