class SoundsLikeStation < ActiveRecord::Base
  attr_accessible :sounds_like_id, :station_id
  
  belongs_to :sounds_like
  belongs_to :station
end
