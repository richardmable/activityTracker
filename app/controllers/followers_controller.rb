class FollowersController < ApplicationController
	# returns all the user's followers
	def index
		authenticate_current_user
		# respond with all the current user's followers
		respond_with User.find(current_user.id).followers
	end

	# action to return everyone the current user is following
	def following
		authenticate_current_user
		# grab all the current user's following
		following = UserFollower.where(user_follower_id: current_user.id)
		# create an empty array
		following_group = []
		# rotate through each following returned, and grab the user object
		following.each do |x|
			# push each following user object into array
			following_group.push(User.find(x.user_id))
		end
		# respond with the array of following user objects
		respond_with following_group

	end

	# action to follow a user
	def follow_user
		authenticate_current_user
		# add the current user to the user they followed list of followers
		respond_with User.find(params.user_id).followers.push(User.find(current_user.id))
	end

	# action to unfollow a user
	def unfollow_user
		authenticate_current_user
		respond_with User.find(params.user_id).followers.destroy(User.find(current_user.id))
	end


end
