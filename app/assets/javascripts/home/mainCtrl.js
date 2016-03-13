// MainCtrl for homepage

angular.module('activityTracker')
.controller('MainCtrl', [
	'$scope',
	'profile',
	'followers',

	function($scope, profile, followers){
		// bind scope to the user's profile, following and followers
		$scope.profile = profile.profile;
		$scope.followers = followers.followers;
		$scope.following = followers.following;
		

}]);