# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Seeding DB for Gabe to design"
10.times do
  new_user = User.new(email: Faker::Internet.email, password: 'fuckyou', first_name: Faker::Name.name, last_name: Faker::Name.name, admin: false)
  new_user.save
  new_shirt = Tshirt.new(name: Faker::TvShows::RickAndMorty.character , description: Faker::TvShows::RickAndMorty.location)
  new_shirt.user = new_user
  new_shirt.save
end

if Tshirt.first
  puts "Seeds sowed successfully!"
else
  puts "Not fertile!"
end
