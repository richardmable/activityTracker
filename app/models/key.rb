class Key < ActiveRecord::Base
	belongs_to :user
	validates :strava_key_secret, uniqueness: true
	validates :fitbit_key_secret, uniqueness: true
	validates :fitbit_key_refresh, uniqueness: true
end
