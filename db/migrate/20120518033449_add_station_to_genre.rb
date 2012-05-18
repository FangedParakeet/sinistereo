class AddStationToGenre < ActiveRecord::Migration
  def change
    add_column :genres, :station_id, :integer
  end
end
