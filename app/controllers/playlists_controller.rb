class PlaylistsController < ApplicationController

  def index #should only be used by admins
    @playlists = Playlist.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlists }
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playlist }
    end
  end

  def new
    @playlist = Playlist.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @playlist }
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def create
    @playlist = Playlist.new(params[:playlist])
    @playlist.user_id = @user.id
    respond_to do |format|
      if @playlist.save
        format.js
        format.html { redirect_to root_url, notice: 'Playlist was successfully created.' }
        format.json { render json: @playlist, status: :created, location: @playlist }
      else
        format.html { render action: "new" }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs
    respond_to do |format|
      if @playlist.update_attributes(params[:playlist])
        format.html { redirect_to root_url, notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
