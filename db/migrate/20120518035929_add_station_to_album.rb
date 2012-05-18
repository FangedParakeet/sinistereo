class AddStationToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :station_id, :integer
  end
end
