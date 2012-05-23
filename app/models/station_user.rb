class StationUser < ActiveRecord::Base
  attr_accessible :station_id, :user_id
  
  belongs_to :station
  belongs_to :user
end
