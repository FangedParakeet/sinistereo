class PlaylistSongsController < ApplicationController
  
  def index
    
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
    @playlist_song = PlaylistSong.find(params[:id])
    @playlist_song.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  

end