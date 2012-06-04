class User < ActiveRecord::Base
  attr_accessible :name,:email,:password, :password_confirmation,:user_type
  has_many :bands, :class_name => 'Artist', :foreign_key => :user_id
  has_secure_password
  has_many :playlists
end
