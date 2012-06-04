# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.
  create_table "album_genres", :force => true do |t|
    t.integer  "album_id"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "album_stations", :force => true do |t|
    t.integer  "album_id"
    t.integer  "station_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "date"
    t.integer  "artist_id"
  end

  create_table "artist_genres", :force => true do |t|
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "artist_id"
  end

  create_table "artist_sounds_likes", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "sounds_like_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "artist_stations", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "station_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "city"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
    t.string   "website"
  end

  create_table "genre_songs", :force => true do |t|
    t.integer  "song_id"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genre_stations", :force => true do |t|
    t.integer  "genre_id"
    t.integer  "station_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "playlist_songs", :force => true do |t|
    t.integer  "song_id"
    t.integer  "playlist_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "playlists", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false

  create_table "old_users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "show_stations", :force => true do |t|
    t.integer  "show_id"
    t.integer  "station_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "city"
    t.string   "country"
    t.string   "venue"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "date"
    t.integer  "artist_id"
  end

  create_table "song_stations", :force => true do |t|
    t.integer  "song_id"
    t.integer  "station_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "favourites"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.integer  "votes",      :default => 0
  end

  create_table "sounds_like_stations", :force => true do |t|
    t.integer  "sounds_like_id"
    t.integer  "station_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "sounds_likes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "station_users", :force => true do |t|
    t.integer  "station_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "play"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
    t.string   "user_type"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
