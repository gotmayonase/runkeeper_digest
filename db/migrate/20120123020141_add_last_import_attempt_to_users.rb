class AddLastImportAttemptToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_import_attempt, :datetime

  end
end
