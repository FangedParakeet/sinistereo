class User < ActiveRecord::Base
  attr_accessible :name,:email,:password, :password_confirmation,:password_digest,:user_type

  has_secure_password
end
