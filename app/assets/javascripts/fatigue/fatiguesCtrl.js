angular.module('activityTracker')

.controller('FatiguesCtrl', [
	'$scope',
	'fatigues',

	function($scope, fatigues){
		// create an empty label array
		$scope.labels = [];
		// create empty data array to be put in $scope.data
		dataArray = []
		// create an empty data array, that takes the data array
		// seems weird but they data array needs to have an array within it
		// possibly so that it can handle multiple data sets
		$scope.data = [dataArray];
		// rotate through the fatigues array response, taken the dates as labels
		// and the fatigue scores as the data for the chart
		for (i = 0; i < fatigues.fatigues.length; i++){
			$scope.labels.push(fatigues.fatigues[i].date);
			dataArray.push(fatigues.fatigues[i].fatigue_score);
		};
		// graph line names
  		$scope.series = ['Fatigue Score'];


}]);