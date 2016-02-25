class ProfilesController < ApplicationController
	before_action :authenticate_current_user
	# this returns the profile information as JSON
	def index
		if user_signed_in?
			profile = User.find(current_user.id).profile
			respond_with profile
		else
			respond_with Profile.new
		end
	end

end
