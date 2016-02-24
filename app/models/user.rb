class User < ActiveRecord::Base
	has_one :profile
	has_one :user_strava_key
	# create a profile for the user with information from Strava
	after_create :create_profile
	#method to create profile
	def create_profile
		Profile.create(user_id: User.last.id, fname: User.last.name.split[0], lname: User.last.name.split[1])
	end
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

end
