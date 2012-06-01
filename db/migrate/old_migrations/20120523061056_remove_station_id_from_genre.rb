class RemoveStationIdFromGenre < ActiveRecord::Migration
  def change
    remove_column :genres, :station_id
  end
end
