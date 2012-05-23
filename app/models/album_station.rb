class AlbumStation < ActiveRecord::Base
  attr_accessible :album_id, :station_id
  
  belongs_to :album
  belongs_to :station
end
