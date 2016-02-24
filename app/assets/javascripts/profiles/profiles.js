angular.module('activityTracker')
.factory('profiles',[
	'$http',
	function($http){
		var p = {
			profiles: []
	};

	p.getProfiles = function(){
		return $http.get('/profiles.json').success(function(data){
			angular.copy(data, p.profiles)
		});
	};
}])