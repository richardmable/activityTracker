class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.integer :user_id
      t.string :avatar_link
      t.string :location
      t.boolean :strava_premium
      t.string :birthday
      t.string :gender
      t.integer :weight

      t.timestamps null: false
    end
  end
end
