class Station < ActiveRecord::Base
  attr_accessible :city, :country, :name, :play
  
  
  has_many :genres
  has_many :albums
  has_many :shows
end
