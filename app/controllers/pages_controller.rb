class PagesController < ApplicationController

  before_filter :require_login, :only => [:home, :data]

  def index
    @songs = Song.premium_blend
  end
  
  def home
    @playlists = @user.playlists
    @songs = Song.premium_blend
    @playlist = Playlist.new
  end
  
  def data
    artists = Artist.order(:name).where("name like ?", "%#{params[:term]}%")
    albums = Album.order(:name).where("name like ?", "%#{params[:term]}%")
    genres = Genre.order(:name).where("name like ?", "%#{params[:term]}%")
    @data = []
    @data << artists
    @data << albums
    @data << genres
    @data.flatten!
    render json: @data.map(&:name)
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
    @playlist_song.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
end

