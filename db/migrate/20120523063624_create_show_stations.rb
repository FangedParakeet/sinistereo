class CreateShowStations < ActiveRecord::Migration
  def change
    create_table :show_stations do |t|
      t.integer :show_id
      t.integer :station_id

      t.timestamps
    end
  end
end
