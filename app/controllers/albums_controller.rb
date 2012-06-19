class AlbumsController < ApplicationController
  
  before_filter :require_login
  before_filter :correct_user, :only => [:show, :edit, :update, :destroy]
  
  def correct_user
    if !@band.albums.include?(Album.find(params[:id]))
      redirect_to root_url, notice: "You shouldn't be here!"
    end
  end
  
  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
    respond_to do |format|
      format.js
      format.html
      format.json { render json: @album }
    end
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])
    @album.artist_id = @band.id

    respond_to do |format|
      if @album.save
        format.js
        format.html { redirect_to root_url }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.js
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.js
        format.html { redirect_to artist_path(@band.id) }
        format.json { head :no_content }
      else
        format.js
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album_id = params[:id]
    @album.songs.each do |song|
      song.destroy
    end
    @album.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to artist_path(@band.id) }
      format.json { head :no_content }
    end
  end
end
