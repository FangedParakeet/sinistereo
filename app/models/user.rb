class User < ActiveRecord::Base
  attr_accessible :bio, :city, :country, :password, :password_confirmation, :username
  
  has_secure_password
  
  has_many :artists
  
  has_many :station_users
  has_many :stations, :through => :station_users
  
  def self.create(params)
    create! do |user|
      user.username = params[:username]
      user.password = params[:password1]
      user.password_confirmation = params[:password2]
      user.city = params[:city]
      user.country = params[:country]
    end
  end
  
end
