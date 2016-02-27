class CreateMotions < ActiveRecord::Migration
  def change
    create_table :motions do |t|
      t.string     :date
      t.integer    :steps
      t.integer    :user_id
      t.timestamps null: false
    end
  end
end
