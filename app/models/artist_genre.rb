class ArtistGenre < ActiveRecord::Base
  attr_accessible :user_id, :genre_id
  
  belongs_to :user
  belongs_to :genre
end
