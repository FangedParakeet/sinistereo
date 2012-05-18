class Album < ActiveRecord::Base
  attr_accessible :name, :station_id
  
  belongs_to :station
end
