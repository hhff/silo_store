# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Seeding..."

User.create(
  :email => "user@example.com", 
  :password => "password", 
  :password_confirmation => "password"
)

Release.create(
  name: "Long Vacation",
  artist: "Rainbow Chan",
  release_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  is_private: true,
  upc_ean: "UPC-EAN-HERE"
)

Release.create(
  name: "See Water",
  artist: "Motion Picture Actress",
  release_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  is_private: true,
  upc_ean: "UPC-EAN-HERE"
)

puts "Complete!"