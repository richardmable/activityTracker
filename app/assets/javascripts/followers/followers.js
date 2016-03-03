angular.module('activityTracker')
.factory('followers', [
	'$http',
	function($http){
		var foll = {
			followers: [],
			following: []
	};
	// retrieve all the user's followers
	foll.getFollowers = function(){
		return $http.get('/followers.json').success(function(data){
			angular.copy(data, foll.followers)
		})
	};
	// retrieve all the users the current user is following
	foll.getFollowing = function(){
		return $http.get('/following.json').success(function(data){
			angular.copy(data, foll.following)
		})
	};
	// add the current user to the follower user's list of followers
	foll.addFollower = function(id){
		return $http.post('/followers.json', id).success(function(data){
			foll.followers.push(data)
		})
	};
	// unfollow a user and return the newly updated list of following
	foll.unFollow = function(id){
		return $http.post('/unfollow.json', id).success(function(data){
			angular.copy(data, foll.following)
		})
	}

	return foll;
}])