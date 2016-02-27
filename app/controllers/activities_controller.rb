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
		parsed.each do |x|
			Activity.create(user_id: current_user.id, name: x['name'], distance: x['distance'], moving_time: x['moving_time'], activity_type: x['type'], start_date_local: x['start_date_local'], average_heartrate: x['average_heartrate'], device_watts: x['device_watts'], average_watts: x['average_watts'], kilojoules: x['kilojoules'], suffer_score: x['suffer_score'])
			# if x['type'] == "Ride" || x['type'] == "VirtualRide"
			# end
		end
		
	end
end
 # t.integer  "user_id"
 #    t.string   "name"
 #    t.float    "distance"
 #    t.integer  "moving_time"
 #    t.string   "type"
 #    t.string   "start_date_local"
 #    t.integer  "average_heartrate"
 #    t.boolean  "device_watts"
 #    t.integer  "average_watts"
 #    t.float    "kilojoules"
 #    t.integer  "suffer_score"

# response activity
# {"id"=>497392050, "resource_state"=>2, "external_id"=>"0982F25C-5FFD-4545-8094-C1907CDC068D", 
# 	"upload_id"=>549003645, "athlete"=>{"id"=>472541, "resource_state"=>1}, 
# 	"name"=>"Friday evening obstacle course", "distance"=>4675.2, "moving_time"=>1070, 
# 	"elapsed_time"=>1102, "total_elevation_gain"=>29.6, "type"=>"Ride", "start_date"=>"2016-02-20T00:08:50Z", 
# 	"start_date_local"=>"2016-02-19T19:08:50Z", "timezone"=>"(GMT-05:00) America/New_York", "location_city"=>"Philadelphia", 
# 	"location_state"=>"Pennsylvania", "location_country"=>"United States", "start_latitude"=>39.95, 
# 	"start_longitude"=>-75.17, "achievement_count"=>0, "kudos_count"=>2, "comment_count"=>0, 
# 	"athlete_count"=>1, "photo_count"=>0, "map"=>{"id"=>"a497392050", "summary_polyline"=>"}
# 	dzrF~pxiMh@pAq@eFp@_AzLv@e_@hcG", "resource_state"=>2}, "trainer"=>false, "commute"=>true, 
# 	"manual"=>false, "private"=>false, "flagged"=>false, "gear_id"=>"b2308251", "average_speed"=>4.369, 
# 	"max_speed"=>10.2, "average_watts"=>105.2, "kilojoules"=>112.6, "device_watts"=>false, "elev_high"=>29.6, 
# 	"elev_low"=>0.0, "total_photo_count"=>0, "has_kudoed"=>false, "workout_type"=>10, "suffer_score"=>nil}