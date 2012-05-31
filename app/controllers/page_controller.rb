class PageController < ApplicationController

  def index
    if @user
      redirect_to home_url
    end
  end
  
  def home
    @stations = @user.stations
    @artist = @user.artists.first
  end
  
  def show
    
  end

end