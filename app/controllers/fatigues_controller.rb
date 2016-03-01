class FatiguesController < ApplicationController
	before_action :authenticate_current_user
	def create

		#take each date
		#caculate score from suffer score or distance
		# store score with date
		# User.find(current_user.id).motions.each do |x|
		# 	x.steps * User.find(current_user.id).activity.where(start_date_local: == x.date)
		# 	x.date
		# 	2012-12-12T19:43:19Z
	end

end
