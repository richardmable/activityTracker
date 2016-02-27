class CreateFatigues < ActiveRecord::Migration
  def change
    create_table :fatigues do |t|
    	t.integer :user_id
    	t.string  :date
    	t.integer :fatigue_score

      t.timestamps null: false
    end
  end
end
