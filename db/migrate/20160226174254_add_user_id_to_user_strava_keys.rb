class AddUserIdToUserStravaKeys < ActiveRecord::Migration
  def change
  	add_column :user_strava_keys, :user_id, :integer
  end
end
