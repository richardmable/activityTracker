angular.module('activityTracker')
.factory('motion', [
	'$http',
	function($http){
		var m = {
			motions: []
	};

	m.getMotion = function(){
		return $http.get('/motions.json').success(function(data){
			angular.copy(data, m.motions)
		})
	};
	return m;
}])