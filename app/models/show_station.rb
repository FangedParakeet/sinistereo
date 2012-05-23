class ShowStation < ActiveRecord::Base
  attr_accessible :show_id, :station_id
  
  belongs_to :show
  belongs_to :station
end
