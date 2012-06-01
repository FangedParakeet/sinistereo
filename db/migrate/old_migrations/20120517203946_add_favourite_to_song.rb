class AddFavouriteToSong < ActiveRecord::Migration
  def change
    add_column :songs, :favourites, :integer
  end
end
