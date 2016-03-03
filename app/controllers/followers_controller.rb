class FollowersController < ApplicationController
	def index
		authenticate_current_user
		respond_with User.find(current_user.id).followers
	end

	def create
	end

end
