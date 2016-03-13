// Controller for the followers page

angular.module('activityTracker')
.controller('FollowersCtrl', [
	'$scope',
	'followers',
	function($scope, followers){
		$scope.followers = followers.followers;
		$scope.following = followers.following;
	



	}])