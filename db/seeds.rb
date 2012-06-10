if Rails.env.development?

  User.destroy_all
  Playlist.destroy_all
  Song.destroy_all
  PlaylistSong.destroy_all

  User.create!(:name => "Adam Admin",
               :email => "admin@admin.com",
               :password => "password",
               :password_confirmation => "password",
               :user_type => "admin")
               

  10.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@myband.net"
    password = "password"
    User.create!(:name => "band_name#{n}",
                 :email => "pat@example.com",
                 :password => "password",
                 :password_confirmation => "password",
                 :user_type => "band")
  end
  
  20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@myband.net"
    password = "password"
    User.create!(:name => "user_name#{n}",
                 :email => "ted@example.com",
                 :password => "password",
                 :password_confirmation => "password",
                 :user_type => "listener")
  end

  #make fake playlists
  test_user = User.create!(:name => "Ted Tester", :email  => "tester@test.com", :password  => "password", :password_confirmation => "password", :user_type => "listener")
  3.times do |n|
    my_playlist = Playlist.create!(:name => "My Test Playlist #{n+1}",
                    :user_id => test_user.id)
    10.times do |n|
      my_playlist.songs.create!(:name => "song #{n+1}")
    end
  end

  #these songs are generated so we can simulare the playlist for the fake top rated songs
    50.times do |n|
      Song.create!(:name => "song #{n+1}", :votes  => 60) 
    end

 puts "Dev environment ready for use."
end
