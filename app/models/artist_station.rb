class ArtistStation < ActiveRecord::Base
  attr_accessible :artist_id, :station_id
  
  belongs_to :artist
  belongs_to :station
end
