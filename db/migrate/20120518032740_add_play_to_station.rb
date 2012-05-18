class AddPlayToStation < ActiveRecord::Migration
  def change
    add_column :stations, :play, :boolean
  end
end
