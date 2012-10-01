class UsersController < ApplicationController
  
  before_filter :require_login, :only => [:show, :edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    @playlists = Playlist.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.js
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    @artist = Artist.new

    respond_to do |format|
      format.js
    end
  end
  
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      if @user
        format.js
      else
        format.html {render action: "edit"}
        format.json {render json: @user.errors}
      end
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.user_type == "Band"
      @artist = Artist.new
    else
      @artist = nil
    end

    respond_to do |format|
      if @artist
        if @user.save
          @artist.user_id = @user.id
          if @artist.save
            session[:uid] = @user.id
            format.html { redirect_to band_tour_url, notice: 'User was successfully created.' }
          else
            format.html { render action: "new" }
            format.json { render json: @artist.errors, status: :unprocessable_entity }
          end
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        if @user.save
          session[:uid] = @user.id
          format.html { redirect_to listener_tour_url, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
      if @user.user_type == "Band"
        respond_to do |format|
          if @user.update_attributes(params[:user])
            if @user.user_type == "Listener"
              @user.bands.first.destroy
            end
            format.js
          else
            format.js
          end
        end
      else
        respond_to do |format|
          if @user.update_attributes(params[:user])
            if @user.user_type == "Band"
              @artist = Artist.new
              @artist.user_id = @user.id
              if @artist.save
                session[:uid] = @user.id
                format.js
              else
                format.js
              end 
            else
            format.js
            end
          else
            format.js
          end
        end
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
