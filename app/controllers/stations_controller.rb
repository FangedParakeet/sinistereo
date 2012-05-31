class StationsController < ApplicationController
  
  include ApplicationHelper
  
  def new
  end

  def create
    station = Station.create(params)
    link_station_to_user(station)
    link_genres_and_artists_to_station(params, station)
    redirect_to home_url
  end
  
  def play
    station = Station.find_by_id(params[:id])
    if params["select#{station.id}"][:play] == "On"
      station.play = true
    else
      station.play = false
    end
    station.save
    redirect_to home_url
  end
  
  def destroy
    station = Station.find_by_id(params[:id])
    station.destroy
    GenreStation.find_all_by_station_id(params[:id]).each do |genre_station|
      genre_station.destroy
    end
    StationUser.find_all_by_station_id(params[:id]).each do |station_user|
      station_user.destroy
    end
    redirect_to home_url
  end
  
  def edit
    
  end
  
  def update
    
  end

end