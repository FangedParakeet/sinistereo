class CreateGenreStations < ActiveRecord::Migration
  def change
    create_table :genre_stations do |t|
      t.integer :genre_id
      t.integer :station_id

      t.timestamps
    end
  end
end
