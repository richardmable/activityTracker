class RenameActivityTablesToActivity < ActiveRecord::Migration
  def change
  	rename_table :activity_tables, :activities
  end
end
