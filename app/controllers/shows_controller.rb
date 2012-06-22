class ShowsController < ApplicationController
  # GET /shows
  # GET /shows.json
  
  before_filter :require_login
  
  def index
    @shows = Show.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shows }
    end
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = Show.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.json
  def new
    @show = Show.new

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
    respond_to do |format|
      format.js
      format.html
      format.json {render json: @show}
    end
  end

  # POST /shows
  # POST /shows.json
  def create
    if !params[:show][:date].empty?
      @show = Show.new(venue: params[:show][:venue], 
                      city: params[:show][:city], 
                      country: params[:show][:country], 
                      date: DateTime.parse(params[:show][:date]))
      @show.artist_id = @band.id
  else
    @show = Show.new
  end

    respond_to do |format|
      if @show.save
        format.js
        format.html { redirect_to root_url }
        format.json { render json: @show, status: :created, location: @show }
      else
        format.js
        format.html { render action: "new" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.json
  def update
    @show = Show.find(params[:id])
    @show.venue = params[:show][:venue]
    @show.city = params[:show][:city]
    @show.country = params[:show][:country]
    if !params[:show][:date].empty?
      @show.date = DateTime.parse(params[:show][:date])
    else
      @show.date = nil
    end

    respond_to do |format|
      if @show.save
        format.js
        format.html { redirect_to root_url }
        format.json { head :no_content }
      else
        format.js
        format.html { render action: "edit" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show = Show.find(params[:id])
    @show_id = params[:id]
    @show.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
