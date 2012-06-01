class RemoveStationIdFromShow < ActiveRecord::Migration
  def change
    remove_column :shows, :station_id
  end
end
