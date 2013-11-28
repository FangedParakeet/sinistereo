require 'json'

class PagesController < ApplicationController

  before_filter :require_login, :only => [:home, :create, :update, :destroy]
  
  def index
    @top_songs = Song.premium_blend.limit(5)
    # START NEW PLAYLIST ---
    if params[:top]
      session[:playlist] = nil
    elsif params[:playlist]
      session[:playlist] = params[:playlist]
    elsif params[:artist]
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
    
    # PLAY CURRENT SONG --
    if session[:playlist]
      @current_playlist = Playlist.find_by_id(session[:playlist])
      # @current_song = @current_playlist.songs.shuffle.first
      @current_songs = @current_playlist.songs.shuffle
    end
    if params[:id]
      song = Song.find_by_id(params[:id])
      @current_songs.delete(song)
      @current_songs.insert(0, song)
    end
    if @current_songs
      @current_song = @current_songs.first
      @artist = @current_song.artist
      @album = @current_song.album
      @song_index = 1
      @these_songs = Array.new
      @current_songs.each do |song|
        @these_songs << song.to_json
      end
    end
  end
  
  def next
    if params[:top]
      session[:playlist] = nil
    elsif params[:playlist]
      session[:playlist] = params[:playlist]
    elsif params[:artist]
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
      # @current_song = @current_playlist.songs.shuffle.first
      @current_songs = @current_playlist.songs.shuffle
    end
    if params[:song]
      @song = Song.find_by_id(params[:song].to_i)
    end
    if @user
      @playlists = @user.playlists
    end
    respond_to do |format|
      format.js
    end
  end
  
  def playlist
    if params[:top]
      session[:playlist] = nil
    elsif params[:playlist]
      session[:playlist] = params[:playlist]
    elsif params[:artist]
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
    
    # PLAY CURRENT SONG --
    if session[:playlist]
      @current_playlist = Playlist.find_by_id(session[:playlist])
      # @current_song = @current_playlist.songs.shuffle.first
      @current_songs = @current_playlist.songs.shuffle
    end
    if params[:song]
      song = Song.find_by_id(params[:song])
      @current_songs.delete(song)
      @current_songs.insert(0, song)
    end
    if @current_songs
      @current_song = @current_songs.first
      @artist = @current_song.artist
      @album = @current_song.album
      @song_index = 1
      @these_songs = Array.new
      @current_songs.each do |song|
        @these_songs << song.to_json
      end
      if @user
        @playlists = @user.playlists
      end
    end
    
  end
      
  def create
    @playlist_song = PlaylistSong.new(params[:playlist_song])
    @playlist = Playlist.find_by_id(params[:playlist_song][:playlist_id])
    @song = Song.find_by_id(params[:playlist_song][:song_id])
    respond_to do |format|
      if @playlist_song.save
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def update
    @playlist_song = PlaylistSong.find(params[:id])
    respond_to do |format|
      if @playlist_song.update_attributes(params[:playlist_song])
        format.js
      else
        format.html { render action: "edit" }
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
    end
  end
  
end

