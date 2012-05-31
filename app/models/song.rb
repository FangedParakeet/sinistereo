class Song < ActiveRecord::Base
  attr_accessible :name, :favourites, :artist_id, :album_id
  
  has_many :genre_songs
  has_many :genres, :through => :genre_songs
  
  has_many :song_stations
  has_many :stations, :through => :song_stations
  
  belongs_to :artist
  belongs_to :album
end
