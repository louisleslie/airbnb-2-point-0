# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clean out existing properties and user accounts. 
Property.destroy_all
User.destroy_all

# Create user profile for each of us with default pw of 'password'.
# Please amend your email if first_name.last_name@gmail.com is going to be hard to remember!
users = ['alex.terenda@gmail.com', 'jake.howlett@gmail.com', 'louis.leslie@gmail.com', 'yunus.firat@gmail.com']

# add 6 random users to have 10 users to add
6.times do
  q = Faker::TvShows::RuPaul.queen
  until q.split(" ").size == 2 && (q.include? "'") == false
    q = Faker::TvShows::RuPaul.queen
  end
  users << "#{q.split(" ")[0].downcase}.#{q.split(" ")[1].downcase}@gmail.com"
end

# Property Types with an initial range of the number of bedrooms (source: Airbnb.com):
property_types = {"House":{"bedrooms":(2..5).to_a}, "Flat":{"bedrooms":(1..5).to_a}, "Bed and breakfast":{"bedrooms":(1..1).to_a}, "Boutique hotel":{"bedrooms":(1..1).to_a}, "Bungalow":{"bedrooms":(2..3).to_a}, "Cabin":{"bedrooms":(1..2).to_a}, "Chalet":{"bedrooms":(5..10).to_a}, "Cottage":{"bedrooms":(1..5).to_a}, "Guest house":{"bedrooms":(1..1).to_a}, "Guest suite":{"bedrooms":(1..1).to_a}, "Hostel":{"bedrooms":(1..1).to_a}, "Hotel":{"bedrooms":(1..1).to_a}, "Loft":{"bedrooms":(1..3).to_a}, "Resort":{"bedrooms":(1..2).to_a}, "Serviced apartment":{"bedrooms":(1..3).to_a}, "Townhouse":{"bedrooms":(2..5).to_a}, "Villa":{"bedrooms":(2..5).to_a}}

# Set locale to GB to get GB postcodes (not sure they are actually valid, but might be wrong!)
Faker::Config.locale = 'en-GB'

users.each do |user|
  name = user.split("@")[0].split(".")
  u = User.new(first_name: name[0].capitalize, last_name: name[1].capitalize, email: user, password: "password", password_confirmation: "password")
  # Assign each User a random number of properties to create as a host.
  num_of_flats = (0..3).to_a.sample
  puts "Creating #{num_of_flats} properties for #{u.email}"
  num_of_flats.times do
    prop = property_types.keys.sample
    bedrooms = property_types[prop][:bedrooms].sample
    bathrooms = (1..bedrooms-1).to_a.sample
    price = (bedrooms * (24..50).to_a.sample) - 0.01
    prop = Property.create(user_id: u.id,
                property_type: prop, 
                total_occupancy: bedrooms*2, 
                total_bedrooms: bedrooms,
                total_bathrooms: bathrooms,
                price_per_night: price,
                summary: Faker::Hipster.paragraph,
                has_kitchen: rand.round(0),
                has_tv: rand.round(0),
                has_heating: rand.round(0),
                has_internet: rand.round(0),
                has_aircon: rand.round(0),
                address: Faker::Address.full_address,
                latitude: Faker::Address.latitude, # latitude and longitude do not correspond to address at the moment
                longitude: Faker::Address.longitude
              )
  end
end


