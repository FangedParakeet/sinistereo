class Song < ActiveRecord::Base
  attr_accessible :name, :favourites, :artist_id, :album_id, :audio, :votes, :user_id
  
  mount_uploader :audio, AudioUploader
  
  
  has_many :genre_songs
  has_many :genres, :through => :genre_songs
  
  has_many :song_stations
  has_many :stations, :through => :song_stations
  
  belongs_to :artist
  belongs_to :album
  belongs_to :user

  #added by BND for Playlist CRUD.
  has_many :playlist_songs
  has_many :playlists, :through => :playlist_songs

  def self.premium_blend
    Song.limit(50).order("votes desc")
  end
  
end
