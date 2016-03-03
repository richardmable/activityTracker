angular.module('activityTracker')

.controller('UserCtrl', [
	'$scope',
	'followers',
	'users',

	function($scope, followers, users){
		$scope.users = users.users;
		// $scope.addFollower = function() {
		// 	followers.
		// }


}]);