class GenreStation < ActiveRecord::Base
  attr_accessible :genre_id, :station_id
  
  belongs_to :genre
  belongs_to :station
  
end
