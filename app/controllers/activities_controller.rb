class ActivitiesController < ApplicationController
	# the update activities action, to grab the last week of activities
	def update
		# be sure to authenticate the user first
		authenticate_current_user
		# call the function to make the API request to Strava
		strava_response
	end

	def strava_response
		# this makes an API request to Strava for the authenticated athlete's 
		# last week of activities
		# the Time.now.to_i - 604800 gives the UNIX epoc time of a week ago
		uri = URI("https://www.strava.com/api/v3/athletes/#{current_user.uid}/activities?access_token=#{current_user.user_strava_key.key_secret}&after=#{Time.now.to_i - 604800}")
		response = Net::HTTP.get(uri)
		# parse the response
		parsed = JSON.parse(response)
		# rotate through each response and create an activity for it, associated with the user who made the request
		# need to add in some logic so that it won't create activities that already exist, use 'name' maybe?
		parsed.each do |x|
			date = x['start_date_local']
			# taking just the year month day from start_date_local
			date = date[0..9]
			Activity.create(user_id: current_user.id, name: x["name"], distance: x['distance'], moving_time: x['moving_time'], activity_type: x['type'], start_date_local: date, average_heartrate: x['average_heartrate'], device_watts: x['device_watts'], average_watts: x['average_watts'], kilojoules: x['kilojoules'], suffer_score: x['suffer_score'])
		end	
	end


end
