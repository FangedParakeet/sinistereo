class SoundsLike < ActiveRecord::Base
  attr_accessible :name
  
  has_many :user_sounds_likes
  has_many :users, :through => :user_sounds_likes
  has_many :sounds_like_stations
  has_many :stations, :through => :sounds_like_stations
end
