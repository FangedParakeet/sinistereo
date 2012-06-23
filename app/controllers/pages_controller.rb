class PagesController < ApplicationController

  before_filter :require_login, :only => [:home, :data, :create, :update, :destroy]
  
  def index
    @songs = Song.premium_blend
    @top_songs = Song.premium_blend.limit(10)
    if params[:id]
      @current_song = Song.find_by_id(params[:id])
    end
    if params[:top]
      session[:playlist] = nil
    end
    if params[:playlist]
      session[:playlist] = params[:playlist]
    end
    if params[:artist]
      artist = Artist.find_by_id(params[:artist])
      if Playlist.find_by_name(artist.name)
        session[:playlist] = Playlist.find_by_name(artist.name).id
        @current_playlist = Playlist.find_by_name(artist.name)
      else
        @current_playlist = Playlist.create(name: artist.name)
        @current_playlist.artist_playlist(params[:artist])
        session[:playlist] = @current_playlist.id
      end
    end
    if session[:playlist]
      @current_playlist = Playlist.find_by_id(session[:playlist])
      @current_song = @current_playlist.songs.shuffle.first
    end
    if @current_song
      @artist = @current_song.artist
      @album = @current_song.album
    end
  end
  
  def home
    @playlists = @user.playlists
    @songs = Song.premium_blend
    @playlist = Playlist.new
  end
  
  
  def create
    @playlist_song = PlaylistSong.new(params[:playlist_song])
    @playlist = Playlist.find_by_id(params[:playlist_song][:playlist_id])
    @song = Song.find_by_id(params[:playlist_song][:song_id])
    respond_to do |format|
      if @playlist_song.save
        format.js
        format.html { redirect_to root_url, notice: 'PlaylistSong was successfully created.' }
        format.json { render json: @playlist_song, status: :created, location: @playlist_song }
      else
        format.html { render action: "new" }
        format.json { render json: @playlist_song.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @playlist_song = PlaylistSong.find(params[:id])
    respond_to do |format|
      if @playlist_song.update_attributes(params[:playlist_song])
        format.js
        format.html { redirect_to root_url, notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playlist_song = PlaylistSong.find_by_id(params[:id])
    @playlist = @playlist_song.playlist
    @song = @playlist_song.song
    @this_song = Song.find_by_id(params[:song])
    @playlist_song.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
end

