SinistereoApp::Application.routes.draw do
  
  resources :shows

  resources :songs

  resources :playlists, :songs, :users
  
  resources :playlist_songs, :only => [:create, :update, :destroy]

  resources :albums

  resources :sessions, :only => [:new, :create, :destroy]
  resources :artists

  get "signin" => "sessions#new", :as => :signin
  post "signin" => "sessions#create" 
  get "signup" => "users#new", :as => :signup
  post "signup" => "users#new"
  get "logout" => "sessions#destroy", :as => :signout
  
  
  resources :pages
  #get "listen" => "pages#show", :as => :listen
  #get "home/data" => "pages#data", :as => :data
  
  # get "home/new_station" => "stations#new", :as => :new_station
  # post "home/station" => "stations#create", :as => :create_station
  # post "home/station/:id/play" => "stations#play", :as => :select_station
  # get "home/station/:id/edit" => "stations#edit", :as => :edit_station
  # put "home/station/:id" => "stations#update", :as => :update_station
  # delete "home/station/:id" => "stations#destroy", :as => :destroy_station
  # 
  # get "home/new_song" => "songs#new", :as => :new_song
  # post "home/song" => "songs#create", :as => :create_song
  # get "home/song/:id/edit" => "songs#edit", :as => :edit_song
  # put "home/song/:id" => "songs#update", :as => :update_song
  # delete "home/song/:id" => "songs#destroy", :as => :destroy_song
  #  
  # get "home/new_album" => "albums#new", :as => :new_album
  # post "home/album" => "albums#create", :as => :create_album
  # get "home/album/:id/edit" => "albums#edit", :as => :edit_album
  # put "home/album/:id" => "albums#update", :as => :update_album
  # delete "home/album/:id" => "albums#destroy", :as => :destroy_album
  # 
  
  root :to => "pages#index"
  
  match ':controller(/:action(/:id(.:format)))'
end
