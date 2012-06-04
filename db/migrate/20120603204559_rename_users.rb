class RenameUsers < ActiveRecord::Migration
  def change
    rename_table :users, :old_users
  end
end
