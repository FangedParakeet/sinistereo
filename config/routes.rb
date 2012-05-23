SinistereoApp::Application.routes.draw do
  
  root :to => "page#index"
  get "home" => "page#home", :as => :home
  post "home" => "session#login", :as => :login
  get "signup" => "session#signup", :as => :signup
  post "signup" => "session#new", :as => :new_user
  delete "logout" => "session#destroy", :as => :logout
  
  
end
