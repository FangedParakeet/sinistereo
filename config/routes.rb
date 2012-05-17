SinistereoApp::Application.routes.draw do
  
  root :to => "page#index"
  get "/home" => "page#new", :as => :home
  post "/home" => "session#login", :as => :login
  get "/signup" => "session#signup", :as => :signup
  post "/signup" => "session#new", :as => :new_user
  
  
end
