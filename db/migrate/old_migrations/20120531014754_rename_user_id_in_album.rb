class RenameUserIdInAlbum < ActiveRecord::Migration

  def change
    rename_column :albums, :user_id, :artist_id
  end

end
