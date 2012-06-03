class User < ActiveRecord::Base
  attr_accessible :name,:email,:password, :password_confirmation, :user_type

  has_secure_password
end
