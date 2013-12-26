# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Seeding..."

user1 = User.create(
  :email => "user1@example.com", 
  :password => "password", 
  :password_confirmation => "password"
)

image = Image.create!
image.imagefile.store!(File.open(File.join(Rails.root, '/public/uploads/image/1/Cover.jpg')))
image.user = user1
image.save!

track = Track.create(
  name: "Skinny Dipping",
  isrc: "ISRC1234"
)

release = Release.create(
  name: "Long Vacation",
  artist: "Rainbow Chan",
  release_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  is_private: true,
  upc_ean: "UPC-EAN-HERE"
)

user1.tracks << track
user1.save!

release.tracks << track
release.user = user1
release.image = image
release.save!

user2 = User.create(
  :email => "user2@example.com", 
  :password => "password", 
  :password_confirmation => "password"
)


puts "Complete!"