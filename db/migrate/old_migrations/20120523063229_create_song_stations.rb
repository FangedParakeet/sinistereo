class CreateSongStations < ActiveRecord::Migration
  def change
    create_table :song_stations do |t|
      t.integer :song_id
      t.integer :station_id

      t.timestamps
    end
  end
end
