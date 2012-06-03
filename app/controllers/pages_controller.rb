class PagesController < ApplicationController

  before_filter :require_login, :only => [:home, :data]

  def index
    if @user
      redirect_to home_url
    end
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

end