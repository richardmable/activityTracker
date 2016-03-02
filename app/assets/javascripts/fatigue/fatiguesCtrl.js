angular.module('activityTracker')

.controller('FatiguesCtrl', [
	'$scope',
	'fatigues',

	function($scope, fatigues){
		$scope.fatigues = fatigues.fatigues;

}])