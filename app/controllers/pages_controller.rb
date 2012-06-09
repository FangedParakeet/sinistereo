class PagesController < ApplicationController

  before_filter :require_login, :only => [:home, :data]

  def index
    @main_playlist = Playlist.first  
    @main_songs = @main_playlist.songs.all

    if @user.present?
      #redirect_to home_url BND commented this out 
      @playlists = Playlist.find_all_by_user_id(@user.id)
    end
    #@playlist = Playlist.all  
    #@songs = Song.all
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs.all

  end
  
  def home
    @artist = @user.bands.first
  end
  
  def show
    
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
  
  def update_playlist
    
  end

end
