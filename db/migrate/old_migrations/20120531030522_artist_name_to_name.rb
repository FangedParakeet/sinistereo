class ArtistNameToName < ActiveRecord::Migration

  def change
    rename_column :artists, :artist_name, :name
  end

end
