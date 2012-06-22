class Playlist < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :playlist_songs
  has_many :songs, :through => :playlist_songs
  
  belongs_to :user
  
  def artist_playlist(artist_id)
    Artist.find_by_id(artist_id).songs.each do |song|
      PlaylistSong.create(song_id: song.id, playlist_id: self.id)
    end
  end
  
end
