class User < ActiveRecord::Base

	has_one  :profile, dependent: :destroy
	has_one  :key, dependent: :destroy
	has_many :activities, dependent: :destroy
	has_many :motions, dependent: :destroy
	has_many :fatigues, dependent: :destroy
	has_many :followers, source: :user_follower, through: :user_followers, dependent: :destroy
	has_many :user_followers, dependent: :destroy
	# create a profile for the user with information from Strava
	after_create :create_profile
	#method to create profile
	def create_profile
		# update the last created profile to associate with user
		Profile.last.update(user_id: User.last.id, fname: User.last.name.split[0], lname: User.last.name.split[1])
	end
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

end
