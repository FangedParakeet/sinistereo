class SoundsLike < ActiveRecord::Base
  attr_accessible :name
  
  has_many :artist_sounds_likes
  has_many :artists, :through => :artist_sounds_likes
  
  has_many :sounds_like_stations
  has_many :stations, :through => :sounds_like_stations
end
