class RemoveStationIdFromSong < ActiveRecord::Migration
  def change
    remove_column :songs, :station_id
  end
end
