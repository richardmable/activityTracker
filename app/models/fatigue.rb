class Fatigue < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :date, :fatigue_score, presence: true
	validates :date, uniqueness: true
end
