class RenameUserSoundsLikesColumns < ActiveRecord::Migration

  def change
    rename_column :artist_sounds_likes, :user_id, :artist_id
  end

end
