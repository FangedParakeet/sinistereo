class ConvertUserToArtist < ActiveRecord::Migration

  def change
    rename_table :user_sounds_likes, :artist_sounds_likes
  end

end
