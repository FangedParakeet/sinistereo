class Song < ActiveRecord::Base
  attr_accessible :name, :favourites, :user_id, :album_id
  
  has_many :genre_songs
  has_many :genres, :through => :genre_songs
  has_many :song_stations
  has_many :stations, :through => :song_stations
  
  belongs_to :user
  belongs_to :album
end
