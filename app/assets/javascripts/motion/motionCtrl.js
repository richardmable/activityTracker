angular.module('activityTracker')

.controller('MotionCtrl', [
	'$scope',
	'motion',

	function($scope, motion){
		// create an empty label array
		$scope.labels = [];
		// create empty data array to be put in $scope.data
		dataArray = []
		// create an empty data array, that takes the data array
		// seems weird but the data array needs to have an array within it
		// possibly so that it can handle multiple data sets
		$scope.data = [dataArray];
		// rotate through the fatigues array response, taken the dates as labels
		// and the fatigue scores as the data for the chart
		for (i = 0; i < motion.motions.length; i++){
			$scope.labels.push(motion.motions[i].date);
			dataArray.push(motion.motions[i].steps);
		};
		// graph line names
  		$scope.series = ['Daily Steps'];


}]);