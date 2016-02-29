class RemoveBirthdayFromProfiles < ActiveRecord::Migration
  def change
  	remove_column :profiles, :birthday
  end
end
