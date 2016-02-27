class CreateUserFollowers < ActiveRecord::Migration
  def change
    create_table :user_followers do |t|
   	  t.integer  :user_id
      t.integer  :user_follower_id
      t.timestamps null: false
    end
  end
end
