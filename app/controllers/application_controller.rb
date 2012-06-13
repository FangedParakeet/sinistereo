class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_user, :setup_playlists,  :find_band
  
  def find_user
    @user = User.find_by_id(session[:uid]) if session[:uid]
  end
  
  def find_band
    if @user
      @band = @user.bands.first
    end
  end
  
  def require_login
    if @user.blank?
      redirect_to root_url, notice: "You must be logged in!"
    end
  end

  def setup_playlists
    @premium_songs = Song.premium_blend 
    if @user.present?
      @playlists = Playlist.find_all_by_user_id(@user.id)
    end
  end
  
end
