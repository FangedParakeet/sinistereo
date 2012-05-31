SinistereoApp::Application.routes.draw do
  
  root :to => "page#index"
  get "home" => "page#home", :as => :home
  get "listen" => "page#show", :as => :listen
  
  post "home" => "session#login", :as => :login
  get "signup" => "session#signup", :as => :signup
  post "signup" => "session#new", :as => :new_user
  delete "logout" => "session#destroy", :as => :logout
  
  get "home/new_station" => "station#new", :as => :new_station
  post "home/station" => "station#create", :as => :create_station
  post "home/station/:id/play" => "station#play", :as => :select_station
  get "home/station/:id/edit" => "station#edit", :as => :edit_station
  put "home/station/:id" => "station#update", :as => :update_station
  delete "home/station/:id" => "station#destroy", :as => :destroy_station
  
  get "home/new_song" => "song#new", :as => :new_song
  post "home/song" => "song#create", :as => :create_song
  get "home/song/:id/edit" => "song#edit", :as => :edit_song
  put "home/song/:id" => "song#update", :as => :update_song
  delete "home/song/:id" => "song#destroy", :as => :destroy_song
 
  get "home/new_album" => "album#new", :as => :new_album
  post "home/album" => "album#create", :as => :create_album
  get "home/album/:id/edit" => "album#edit", :as => :edit_album
  put "home/album/:id" => "album#update", :as => :update_album
  delete "home/album/:id" => "album#destroy", :as => :destroy_album
  
  
  
end
