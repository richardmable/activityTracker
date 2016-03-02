angular.module('activityTracker')

.controller('FatigueCtrl', [
	'$scope',
	'fatigues',

	function($scope, fatigues){
		$scope.fatigues = fatigues;

}])