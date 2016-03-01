class FatiguesController < ApplicationController

	def update
		authenticate_current_user
		fatigue_scores_update
	end

	def fatigue_scores_update

		#take each date
		#caculate score from suffer score or distance
		# store score with date
		User.find(current_user.id).motions.each do |x|
			# set distance to distance of actvity in km
			if User.find(current_user.id).activities.where(start_date_local: x.date) != []
				distance = User.find(current_user.id).activities.where(start_date_local: x.date).first.distance / 1000
				# converts steps to semi-equivilent bike miles (10,000 steps = 20 bike miles)
				# would like to add in score that reflects previous days and average miles, fitness etc.
				fatigue_score = (x.steps / 500) + distance
				# create that particular day's fatigue score
				Fatigue.create(user_id: current_user.id, fatigue_score: fatigue_score, date: x.date)
			end

		end

	end

end
