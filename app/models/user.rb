class User < ActiveRecord::Base
  attr_accessible :name,:email,:password_digest,:user_type
end
