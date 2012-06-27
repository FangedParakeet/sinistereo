class ToursController < ApplicationController 
  
  before_filter :require_login

  def band
    if @user.user_type == "Band"
      @songs = Song.premium_blend
      @top_songs = Song.premium_blend.limit(10)  
      if session[:playlist]
        @current_playlist = Playlist.find_by_id(session[:playlist])
      end
      if @current_song
        @artist = @current_song.artist
        @album = @current_song.album
      end
    else  
      redirect_to root_url, notice: "You shouldn't be there!"
    end
  end
  
  def listener
    if @user.user_type == "Listener"
      @songs = Song.premium_blend
      @top_songs = Song.premium_blend.limit(10)
      if session[:playlist]
        @current_playlist = Playlist.find_by_id(session[:playlist])
      end
      
      if @current_song
        @artist = @current_song.artist
        @album = @current_song.album
      end
    else
      redirect_to root_url, notice: "You shouldn't be there!"
    end
  end
  
  def account
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if session[:playlist]
      @current_playlist = Playlist.find_by_id(session[:playlist])
    end
    if @current_song
      @artist = @current_song.artist
      @album = @current_song.album
    end
    respond_to do |format|
      format.js
    end
  end
  
  def dash
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if session[:playlist]
      @current_playlist = Playlist.find_by_id(session[:playlist])
    end
    if @current_song
      @artist = @current_song.artist
      @album = @current_song.album
    end
    respond_to do |format|
      format.js
    end
    
  end
  
  def vote
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if session[:playlist]
      @current_playlist = Playlist.find_by_id(session[:playlist])
    end
    if @current_song
      @artist = @current_song.artist
      @album = @current_song.album
    end
    respond_to do |format|
      format.js
    end
    
  end
  
  def play
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if session[:playlist]
      @current_playlist = Playlist.find_by_id(session[:playlist])
    end
    if @current_song
      @artist = @current_song.artist
      @album = @current_song.album
    end
    @playlist = Playlist.new
    respond_to do |format|
      format.js
    end
    
  end

end