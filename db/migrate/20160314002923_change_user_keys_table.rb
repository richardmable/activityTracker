class ChangeUserKeysTable < ActiveRecord::Migration
  def change
  	rename_table :user_strava_keys, :keys
  	rename_column :keys, :key_secret, :strava_key_secret
  	add_column :keys, :fitbit_key_secret, :string
  	add_column :keys, :fitbit_key_refresh, :string
  end
end
