class PlaylistSong < ActiveRecord::Base
  attr_accessible :song_id, :playlist_id
  
  belongs_to :song
  belongs_to :playlist
end
