class Artist < ActiveRecord::Base
  attr_accessible :name, :bio, :city, :country, :user_id
  
  has_many :songs
  has_many :albums
  has_many :shows
  
  has_many :artist_sounds_likes
  has_many :sounds_likes, :through => :artist_sounds_likes
  
  has_many :artist_genres
  has_many :genres, :through => :artist_genres
  
  has_many :artist_stations
  has_many :stations, :through => :artist_stations
  
  belongs_to :linked_user, :class_name => 'User', :foreign_key => :user_id
  
  def self.create(params, user)
    create! do |artist|
      artist.name = params[:artist_name]
      artist.city = params[:city]
      artist.country = params[:country]
      artist.user_id = user.id
    end
  end
  
end
