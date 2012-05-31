class ArtistGenre < ActiveRecord::Base
  attr_accessible :artist_id, :genre_id
  
  belongs_to :artist
  belongs_to :genre
end
