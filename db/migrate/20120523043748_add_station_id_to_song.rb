class AddStationIdToSong < ActiveRecord::Migration
  def change
    add_column :songs, :station_id, :integer
  end
end
