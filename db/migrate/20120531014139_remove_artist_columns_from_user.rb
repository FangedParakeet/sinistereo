class RemoveArtistColumnsFromUser < ActiveRecord::Migration

  def change
    remove_column :users, :artist_name
    remove_column :users, :is_artist
  end

end
