class Genre < ActiveRecord::Base
  attr_accessible :name

  has_many :genre_songs
  has_many :songs, :through => :genre_songs
  
  has_many :artist_genres
  has_many :artists, :through => :artist_genres
  
  has_many :album_genres
  has_many :albums, :through => :album_genres
  
  has_many :genre_stations
  has_many :stations, :through => :genre_stations

end
