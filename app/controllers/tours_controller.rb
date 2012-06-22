class ToursController < ApplicationController 
  
  before_filter :require_login

  def band
    if @user.user_type == "Band"
      @songs = Song.premium_blend
      @top_songs = Song.premium_blend.limit(10)  
      if @current_song
        @artist = @current_song.artist
      end
    else  
      redirect_to root_url, notice: "You shouldn't be there!"
    end
  end
  
  def listener
    if @user.user_type == "Listener"
      @songs = Song.premium_blend
      @top_songs = Song.premium_blend.limit(10)
      if @current_song
        @artist = @current_song.artist
      end
    else
      redirect_to root_url, notice: "You shouldn't be there!"
    end
  end
  
  def account
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if @current_song
      @artist = @current_song.artist
    end
    respond_to do |format|
      format.js
    end
  end
  
  def dash
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if @current_song
      @artist = @current_song.artist
    end
    respond_to do |format|
      format.js
    end
    
  end
  
  def vote
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if @current_song
      @artist = @current_song.artist
    end
    respond_to do |format|
      format.js
    end
    
  end
  
  def play
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if @current_song
      @artist = @current_song.artist
    end
    @playlist = Playlist.new
    respond_to do |format|
      format.js
    end
    
  end

end