class Motion < ActiveRecord::Base
	belongs_to :user
	validates :date, presence: true
	validates :steps, :user_id, presence: true
end
