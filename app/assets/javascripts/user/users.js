angular.module('activityTracker')
.factory('users', [
	'$http',
	function($http){
		var u = {
			users: []
	};
	// retrieve all the user's followers
	u.getUsers = function(){
		return $http.get('/users.json').success(function(data){
			angular.copy(data, u.users)
		})
	};

	return u;
}])