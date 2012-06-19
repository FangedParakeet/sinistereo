class User < ActiveRecord::Base
  attr_accessible :name,:email,:password, :password_confirmation,:user_type
  
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  
  has_secure_password
  
  has_many :bands, :class_name => 'Artist', :foreign_key => :user_id
  
  has_many :playlists
  
  has_many :favourites, :class_name => 'Song', :foreign_key => :user_id

end
