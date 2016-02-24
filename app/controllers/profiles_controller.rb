class ProfilesController < ApplicationController
	def index
		profile = User.find(current_user.id).profile
		respond_with profile
	end

end
