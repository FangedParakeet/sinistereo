class CreateAlbumGenres < ActiveRecord::Migration
  def change
    create_table :album_genres do |t|
      t.integer :album_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
