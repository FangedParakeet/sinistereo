# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  User.destroy_all

  User.create!(:name => "Adam Admin",
               :email => "admin@admin.com",
               :password => "password",
               :password_confirmation => "password",
               :user_type => "admin")

  10.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@myband.net"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password,
                 :user_type => "band")
  end
  
  20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@myband.net"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password,
                 :user_type => "listener")
  end

  puts "Dev environment ready for use."
end
