angular.module('activityTracker')
.factory('profile',[
	'$http',
	function($http){
		var p = {
			profile: []
	};
	// method to grab the user's profile information
	p.getProfile = function(){

		return $http.get('/profiles.json').success(function(data){
			angular.copy(data, p.profile)
		})
	};
	// return the p object containing the profile array so that 
	// it is exposed to any other Angular module that needs it
	return p;
}])