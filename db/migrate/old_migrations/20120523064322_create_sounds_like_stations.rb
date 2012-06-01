class CreateSoundsLikeStations < ActiveRecord::Migration
  def change
    create_table :sounds_like_stations do |t|
      t.integer :sounds_like_id
      t.integer :station_id

      t.timestamps
    end
  end
end
