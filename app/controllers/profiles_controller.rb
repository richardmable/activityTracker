class ProfilesController < ApplicationController
	before_action :authenticate_current_user
	# this returns the profile information as JSON
	def index
		
		if current_user 
			profile = User.find(current_user.id).profile
			respond_with profile
		else
			respond_with Profile.new
		end
	end
	# a method to update user's profile info
	# incase they update on Strava
	def update
	end


end
