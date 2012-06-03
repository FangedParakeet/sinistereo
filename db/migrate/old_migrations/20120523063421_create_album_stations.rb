class CreateAlbumStations < ActiveRecord::Migration
  def change
    create_table :album_stations do |t|
      t.integer :album_id
      t.integer :station_id

      t.timestamps
    end
  end
end
