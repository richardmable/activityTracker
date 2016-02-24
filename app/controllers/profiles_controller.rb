class ProfilesController < ApplicationController
	def show
		profile = User.find(current_user.id).profile
		respond_with profile
	end

end
