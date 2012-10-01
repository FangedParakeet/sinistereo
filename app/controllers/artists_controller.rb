class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  
  before_filter :require_login

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.js
      format.json { render json: @artist }
    end
  end

  # GET /artists/new
  # GET /artists/new.json
  def new
    @artist = Artist.new

    respond_to do |format|
      format.json { render json: @artist }
    end
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end


  # PUT /artists/1
  # PUT /artists/1.json
  def update
    @artist = Artist.find(params[:id])
    flash[:notice] = "Updated!"

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.js
        format.html { redirect_to root_url }
      else
        format.js
      end
    end
  end

end
