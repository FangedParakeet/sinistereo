class PageController < ApplicationController

  def index
    if @user
      redirect_to home_url
    end
  end
  
  def home
    @stations = @user.stations
    @is_artist = @user.is_artist
  end
  
  def show
    
  end

end