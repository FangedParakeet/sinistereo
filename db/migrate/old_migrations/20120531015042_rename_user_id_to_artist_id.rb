class RenameUserIdToArtistId < ActiveRecord::Migration
  def change
    rename_column :songs, :user_id, :artist_id
    rename_column :shows, :user_id, :artist_id
  end
end
