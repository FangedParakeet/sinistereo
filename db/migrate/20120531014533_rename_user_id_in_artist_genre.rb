class RenameUserIdInArtistGenre < ActiveRecord::Migration
  def change
    rename_column :artist_genres, :user_id, :artist_id
  end
end
