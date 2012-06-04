class ChangeAlbumDateToMonth < ActiveRecord::Migration
  def change
    rename_column :albums, :date, :year
  end
end
