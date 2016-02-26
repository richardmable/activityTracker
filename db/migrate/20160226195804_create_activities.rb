class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer      :user_id
      t.string       :name
      t.float        :distance
      t.integer      :moving_time
      t.string       :type
      t.string       :start_date_local
      t.integer      :average_heartrate
      t.boolean      :device_watts
      t.integer      :average_watts
      t.float        :kilojoules
      t.integer      :suffer_score

      t.timestamps null: false
    end
  end
end
