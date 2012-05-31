class Artist < ActiveRecord::Base
  attr_accessible :artist_name, :bio, :city, :country, :user_id
  
  has_many :songs
  has_many :albums
  has_many :shows
  
  has_many :artist_sounds_likes
  has_many :sounds_likes, :through => :artist_sounds_likes
  
  has_many :artist_genres
  has_many :genres, :through => :artist_genres
  
  has_many :artist_stations
  has_many :stations, :through => :artist_stations
  
  belongs_to :user
  
end
