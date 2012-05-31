class Show < ActiveRecord::Base
  attr_accessible :city, :country, :venue, :date, :artist_id
  
  has_many :show_stations
  has_many :stations, :through => :show_stations
  
  belongs_to :artist
end
