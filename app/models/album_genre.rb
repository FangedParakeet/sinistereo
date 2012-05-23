class AlbumGenre < ActiveRecord::Base
  attr_accessible :album_id, :genre_id
  
  belongs_to :album
  belongs_to :genre
end
