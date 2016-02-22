// controller for the navigation bar
angular.module('activityTracker')

.controller('NavCtrl', [
	'$scope',
	// inject the Auth module into the nav bar controller
	// the Auth module comes from angular-devise Angular JS service
	// it allows Angular to interact with Devise
	'Auth',

	function($scope, Auth){
		// this exposes the isAuthenticated and logout method to $scope
		$scope.signedIn = Auth.isAuthenticated;
		$scope.logout = Auth.logout;
		// this attempts to access Auth.currentUser when the controller loads to set $scope.user
		// only completes if there is a user logged in
		Auth.currentUser().then(function(user){
			$scope.user = user;
		});
		// event listeners to handle when the user authenticates and logs out
		// angular-devise automatically broadcasts events when authentication happens
		// set $scope.user on new user registration
		$scope.$on('devise:new-registration', function(e, user){
			$scope.user = user;
		});
		// set $scope.user on user login
		$scope.$on('devise:login', function(e, user){
			$scope.user = user;
		});
		// clear $scope.user on user log out
		$scope.$on('devise:logout', function(e, user){
			$scope.user = {};
		})

}]);