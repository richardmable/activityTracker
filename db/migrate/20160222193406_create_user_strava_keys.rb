class CreateUserStravaKeys < ActiveRecord::Migration
  def change
    create_table :user_strava_keys do |t|
      t.string :key_secret

      t.timestamps null: false
    end
  end
end
