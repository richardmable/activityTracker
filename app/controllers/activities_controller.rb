class ActivitiesController < ApplicationController
	# the update activities action, to grab the last week of activities
	def update
		# be sure to authenticate the user first
		authenticate_current_user
		# call the function to make the API request to Strava
		strava_response
	end
end
