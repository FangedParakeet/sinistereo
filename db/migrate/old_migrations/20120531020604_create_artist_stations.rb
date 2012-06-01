class CreateArtistStations < ActiveRecord::Migration
  def change
    create_table :artist_stations do |t|
      t.integer :artist_id
      t.integer :station_id

      t.timestamps
    end
  end
end
