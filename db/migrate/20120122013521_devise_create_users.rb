class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.string :nickname
      t.string :token
      t.string :athlete_type
      t.date :birthday
      t.string :gender
      t.string :goal
      t.string :location
      t.integer :runkeeper_id
      t.string :name
      t.string :medium_picture
      t.string :normal_picture


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

end
