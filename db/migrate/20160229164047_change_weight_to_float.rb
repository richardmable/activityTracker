class ChangeWeightToFloat < ActiveRecord::Migration
  def change
  	change_column :profiles, :weight, :float
  end
end
