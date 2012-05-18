class User < ActiveRecord::Base
  attr_accessible :artist_name, :bio, :city, :country, :is_artist?, :password, :password_confirmation, :username
  
  has_secure_password
  

  
  def self.create(params)
    create! do |user|
      user.username = params[:username]
      user.password = params[:password1]
      user.password_confirmation = params[:password2]
      user.city = params[:city]
      user.country = params[:country]
      if params[:artist][:is_artist] == "Yes"
        user.is_artist = true
        user.artist_name = params[:artist_name]
      else
        user.is_artist = false
      end
    end
  end
  
end
