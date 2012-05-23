class Station < ActiveRecord::Base
  attr_accessible :city, :country, :name, :play
  
  has_many :song_stations
  has_many :songs, :through => :song_stations
  has_many :album_stations
  has_many :albums, :through => :album_stations
  has_many :show_stations
  has_many :shows, :through => :show_stations
  has_many :genre_stations
  has_many :genres, :through => :genre_stations
  has_many :sounds_like_stations
  has_many :sounds_likes, :through => :sounds_like_stations
  has_many :station_users
  has_many :users, :through => :station_users
  
end
