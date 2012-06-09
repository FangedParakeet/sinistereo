class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_user, :setup_playlists 

  def find_user
    @user = User.find_by_id(session[:uid])    
  end
  
  def require_login
    if @user.blank?
      redirect_to root_url, notice: "You must be logged in!"
    end
  end

  def setup_playlists
    #@main_playlist = Song.premium_blend #Playlist.first
    #@premium_songs = @main_playlist.songs.all
    @premium_songs = Song.premium_blend 


    if @user.present?
      @playlists = Playlist.find_all_by_user_id(@user.id)
    end
  end

end
