class GenreSong < ActiveRecord::Base
  attr_accessible :genre_id, :song_id
  
  belongs_to :genre
  belongs_to :song
end
