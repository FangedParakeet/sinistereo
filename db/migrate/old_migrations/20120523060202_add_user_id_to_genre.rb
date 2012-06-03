class AddUserIdToGenre < ActiveRecord::Migration
  def change
    add_column :artist_genres, :user_id, :integer
  end
end
