class CreateActivityTable < ActiveRecord::Migration
  def change
    create_table :activity_tables do |t|
      t.integer      :user_id
      t.string       :name
      t.float        :distance
      t.integer      :moving_time
      t.string       :activity_type
      t.string       :start_date_local
      t.integer      :average_heartrate
      t.boolean      :device_watts
      t.integer      :average_watts
      t.float        :kilojoules
      t.integer      :suffer_score
    end
  end
end
