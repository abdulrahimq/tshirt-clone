# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying ..."

Item.destroy_all
Order.destroy_all
Tshirt.destroy_all
User.destroy_all

new_admin_user = User.create!(email: 'admin@gmail.com', password: 'fuckyou', admin: true)

puts "Seeding ..."
10.times do
  new_user = User.new(email: Faker::Internet.email, password: 'fuckyou', first_name: Faker::Name.name, last_name: Faker::Name.name, admin: false)
  new_user.save!
  new_shirt = Tshirt.new(remote_photo_url: (Faker::Avatar.image), name: Faker::TvShows::RickAndMorty.character , description: Faker::TvShows::RickAndMorty.location, price: 10.00)
  puts new_shirt.photo
  new_shirt.user = new_user

  new_shirt.save!
  puts new_shirt.photo
end

if Tshirt.first
  puts "Finished ..."
else
  puts "Error ..."
end
