class UserStravaKey < ActiveRecord::Base
	belongs_to :user
	validates :key_secret, uniqueness: true
end
