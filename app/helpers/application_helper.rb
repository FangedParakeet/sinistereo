module ApplicationHelper
  
  def separate_elements(list)
    items = []
    if list.include?(",")
      list.split(", ").each do |elt|
        items << elt
      end
    else
      items << list
    end
    return items
  end
  
  def link_station_to_user(station)
    
    
  end
  
  def link_genres_and_artists_to_station(params, station)
    separate_elements(params[:artists]).each do |artist|
      if User.find_by_artist_name(artist)
        StationUser.create(station_id: station.id, user_id: User.find_by_artist_name(artist).id)
      end
    end
    separate_elements(params[:genres]).each do |genre|
      if Genre.find_by_name(genre.downcase)
        GenreStation.create(station_id: station.id, genre_id: Genre.find_by_name(genre.downcase).id)
      else
        Genre.create(name: genre.downcase)
        GenreStation.create(station_id: station.id, genre_id: Genre.find_by_name(genre.downcase).id)
      end
    end
  end
  
  
end
