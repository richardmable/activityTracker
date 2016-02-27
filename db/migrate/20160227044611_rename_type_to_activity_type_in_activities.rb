class RenameTypeToActivityTypeInActivities < ActiveRecord::Migration
  def change
  	change_column :activities, :type, :activity_type
  end
end
