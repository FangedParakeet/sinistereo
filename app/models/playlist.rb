class Playlist < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :playlist_songs
  has_many :songs, :through => :playlist_songs
  
  belongs_to :user
  
end
