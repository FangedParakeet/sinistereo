class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  
  before_filter :require_login
  
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    
    respond_to do |format|
      format.js
      format.html
      format.json { render json: @song }
    end 
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])
    @song.artist_id = @band.id

    respond_to do |format|
      if @song.save
        format.js
        format.html { redirect_to root_url }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.js
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.js
        format.html { redirect_to root_url }
        format.json { head :no_content }
      else
        format.js
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song_id = params[:id]
    @song.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to artist_path(@band.id) }
      format.json { head :no_content }
    end
  end
  
  def upvote
    @song = Song.find_by_id(params[:id])
    @song.votes += 1
    respond_to do |format|
      if @song.save
        format.js
        format.html { redirect_to root_url, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def downvote
    @song = Song.find_by_id(params[:id])
    @song.votes -= 1
    respond_to do |format|
      if @song.save
        format.js
        format.html { redirect_to root_url, notice: 'Upvoted!' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { redirect_to root_url, notice: "Something went wrong." }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
    
  end
end
