class Show < ActiveRecord::Base
  attr_accessible :city, :country, :venue, :station_id
  
  belongs_to :station
end
