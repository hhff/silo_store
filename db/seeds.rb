# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding..."

Spree::Core::Engine.load_seed if defined?(Spree::Core)

user1 = User.create(
  :email => "hello@siloarts.net", 
  :password => "grain5grain5", 
  :password_confirmation => "grain5grain5",
  :context => "siloarts"
)

image = Image.create(
  :imagefile => (File.open(File.join(Rails.root, '/public/uploads/image/1/Cover.png')))
)
image.user = user1
image.save!

track1 = Track.create(
  name: "Skinny Dipping",
  isrc: "ISRC1234"
)

track2 = Track.create(
  name: "Milk",
  isrc: "ISRC5678"
)

release = Release.create(
  name: "Long Vacation",
  artist: "Rainbow Chan",
  release_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  is_private: true,
  upc_ean: "UPC-EAN-HERE"
)

# SPREE STUFF

shipping_category = Spree::ShippingCategory.create!(:name => 'Digital')

shipping_method = Spree::ShippingMethod.new(
  name: 'Digital',
  display_on: :both, 
  calculator_type: "Spree::Calculator::Shipping::FlatRate"
)

zone = Spree::Zone.create!(name: "World")

countries = Spree::Country.all

countries.each do |country|
  zone.zone_members.create!(zoneable: country)
end


shipping_method.shipping_categories << shipping_category
shipping_method.zones << zone

shipping_method.save!

# Setup Dummy Product

property = Spree::Property.create!(:name => 'artist', :presentation => 'Artist')

coverimage = Spree::Image.create!(
  :attachment => (File.open(File.join(Rails.root, '/public/uploads/image/1/Cover.png')))
)

# I think Prototypes are only for backend?
prototype = Spree::Prototype.create!(:name => 'Release')
prototype.properties << property
prototype.save!

# Create Product (This will eventually be automatic in the Create action for a release!)
product = Spree::Product.create!(
  :name => release.name,
  :price => 7.00,
  :shipping_category => shipping_category,
  :available_on => release.release_date,
)

stock_location = Spree::StockLocation.create!(
  name: "Digital",
  backorderable_default: true
)

stock_item = Spree::StockItem.find_by(variant_id: product.master.id)

stock_item.stock_location_id = stock_location.id
stock_item.backorderable = true
stock_item.adjust_count_on_hand(50)

product.master.track_inventory = false
product.properties << property
product.set_property('artist', release.artist)
product.images << coverimage
product.save!

gateway = Spree::PaymentMethod.create!(
  type: "Spree::Gateway::StripeGateway",
  name: "Stripe Gateway for Silo Arts",
  environment: "development"
)

gateway.set_preference(:server,  'test')
gateway.set_preference(:publishable_key,  ENV['STRIPE_PUBLIC_KEY'])
gateway.set_preference(:secret_key,  ENV['STRIPE_API_KEY'])

# SETUP USERS & ASSOCIATIONS

user1.products << product
user1.spree_roles << Spree::Role.find_or_create_by(name: "admin")
user1.tracks << track1
user1.tracks << track2
user1.save!

release.tracks << track1
release.tracks << track2
release.user = user1
release.image = image
release.save!

# GUEST FOR FRONTEND API

guest = User.create(
  :email => "guest@example.com", 
  :password => "password", 
  :password_confirmation => "password"
)

guest.spree_roles << Spree::Role.find_or_create_by(name: "user")
guest.generate_spree_api_key!
SiloStore::Application::SPREE_GUEST_API_KEY = guest.spree_api_key



puts "Complete!"
