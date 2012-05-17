class RemoveIsArtistQ < ActiveRecord::Migration
  def change
    remove_column :users, :is_artist?
  end
end
