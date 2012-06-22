class UsersController < ApplicationController
  
  before_filter :require_login, :only => [:index, :show, :edit, :update, :destroy]
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @playlists = Playlist.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    @artist = Artist.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      if @user
        format.js
        format.html {redirect_to root_url}
        format.json {render json: @user}
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
            format.json { render json: @user, status: :created, location: @user }
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
            format.html { redirect_to root_url }
            format.json { head :no_content }
          else
            format.js
            format.html { render action: "edit" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
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
                format.html { redirect_to @user }
                format.json { render json: @user, status: :created, location: @user }
              else
                format.html { render action: "new" }
                format.json { render json: @artist.errors, status: :unprocessable_entity }
              end 
            end
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { head :no_content }
          else
            format.js
            format.html { render action: "edit" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
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
