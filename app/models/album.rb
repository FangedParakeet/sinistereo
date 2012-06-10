class Album < ActiveRecord::Base
  attr_accessible :name, :year, :artist_id
  
  has_many :songs
  
  has_many :album_genres
  has_many :genres, :through => :album_genres
  
  has_many :album_stations
  has_many :stations, :through => :album_stations
  
  belongs_to :artist
end
