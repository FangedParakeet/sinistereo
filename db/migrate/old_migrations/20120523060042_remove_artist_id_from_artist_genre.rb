class RemoveArtistIdFromArtistGenre < ActiveRecord::Migration

  def change
    remove_column :artist_genres, :artist_id
  end

end
