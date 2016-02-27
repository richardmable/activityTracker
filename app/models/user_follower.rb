class UserFollower < ActiveRecord::Base
	belongs_to :user
	belongs_to :user_follower, class_name: "User"
end
