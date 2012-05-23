class SongStation < ActiveRecord::Base
  attr_accessible :song_id, :station_id
  
  belongs_to :song
  belongs_to :station
end
