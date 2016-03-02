angular.module('activityTracker')
.factory('fatigues' [
	'$http',
	function($http){
		var f = {
			fatigues: []
	};

	f.update = function(){
		return $http.get('/fatigues.json').success(function(data){
			angular.copy(data, f.fatigues)
		})
	};
	return f;
}])