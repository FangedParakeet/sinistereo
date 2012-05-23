class UserSoundsLike < ActiveRecord::Base
  attr_accessible :sounds_like_id, :user_id
  
  belongs_to :sounds_like
  belongs_to :user
end
