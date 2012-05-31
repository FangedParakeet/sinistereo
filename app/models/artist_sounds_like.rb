class ArtistSoundsLike < ActiveRecord::Base
  attr_accessible :sounds_like_id, :artist_id
  
  belongs_to :sounds_like
  belongs_to :artist
end
