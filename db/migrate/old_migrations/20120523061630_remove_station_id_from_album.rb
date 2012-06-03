class RemoveStationIdFromAlbum < ActiveRecord::Migration
  def change
    remove_column :albums, :station_id
  end
end
