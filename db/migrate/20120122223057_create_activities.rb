class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.datetime :start_time
      t.integer :total_distance
      t.decimal :duration
      t.decimal :total_calories
      t.integer :user_id
      t.string :uri

      t.timestamps
    end
    
    add_index :activities, :uri
    add_index :activities, :activity_type
    add_index :activities, :start_time
  end
end
