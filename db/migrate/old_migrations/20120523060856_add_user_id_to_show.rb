class AddUserIdToShow < ActiveRecord::Migration
  def change
    add_column :shows, :user_id, :integer
  end
end
