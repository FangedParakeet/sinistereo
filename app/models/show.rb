class Show < ActiveRecord::Base
  attr_accessible :city, :state, :venue, :date, :artist_id
  
  has_many :show_stations
  has_many :stations, :through => :show_stations
  
  validates :date, :presence => true
  
  belongs_to :artist
end
