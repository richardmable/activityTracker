// MainCtrl for homepage

angular.module('activityTracker')
.controller('MainCtrl', [
	'$scope',
	'$auth',
	'profile',
	'followers',

	function($scope, $auth, profile, followers){
		// bind scope to the user's profile, following and followers
		$scope.profile = profile.profile;
		$scope.followers = followers.followers;
		$scope.following = followers.following;
		$scope.fitBitInfo = function(){
			$auth.authenticate('fitbit');
		}
		

}]);