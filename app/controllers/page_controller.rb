class PageController < ApplicationController

  def index
    
  end
  
  def home
    @stations = User.stations
  end

end