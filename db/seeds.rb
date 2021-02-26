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

addresses = ["9 Smalldale Road, Birmingham, B42 2RX", 
  "82 Grammar School Road, Brigg, DN20 8AY", 
  "1A Queens Road, Annitsford, NE23 7RA", 
  "4 Morley Road, Romford, RM6 6XB", 
  "Kimberley, Horton Road, Staines, TW19 6BQ", 
  "17 Charles Street, Leabrooks, DE55 1LZ", 
  "Bryn Gwynt, Beddgelert, LL55 4UU", 
  "41 Douglas Road, Tonbridge, TN9 2TH", 
  "2 Victoria Place, Wanswell, GL13 9SB", 
  "16 Windy Street, Chipping, PR3 2GD", 
  "55 Moorland Avenue, Lincoln, LN6 7RE", 
  "40 Hazelwood Road, Oxted, RH8 0HZ", 
  "2 Willow Close, Watlington, PE33 0JR", 
  "26 Bell Hill, Finedon, NN9 5ND", 
  "242 Little Brays, Harlow, CM18 6ER", 
  "8 Ilchester Road, Chilthorne Domer, BA22 8RF", 
  "119 New Road, Chatteris, PE16 6BU", 
  "Gwynfa, Cae Garw, Llanfair, LL46 2RL", 
  "4 West Court, Braybrooke Road, Market Harborough, LE16 8GB",
  "6 Swanholme Close, Lincoln, LN6 3DE",
  "77 Windsor Court, London, N14 5HT",
  "47 Pendeford Mill Lane, Codsall, WV8 1JG",
  "4 The Mews, Pulborough, RH20 2BB",
  "71 Norbury Road, Feltham, TW13 4SR",
  "Flat 28, St. Peters House, Queens Row, London, SE17 2PT",
  "1 Cawley Lane, Heckmondwike, WF16 0BJ",
  "26 Rowe Avenue, Peacehaven, BN10 7PF",
  "8 Beaufort Close, Plymouth, PL5 1AR",
  "6 Kingsmoor Road, Harlow, CM19 4HR",
  "24 Hood Close, Sleaford, NG34 7WJ",
  "8 Fitzroy Court, Bartlett Crescent, High Wycombe, HP12 3DW", 
  "Rose Villa, Cherry Chase, Tiptree, CO5 0AE", 
  "Flat A-C, 122 Whitechapel Road, London, E1 1JE", 
  "2 May Pasture, Great Shelford, CB22 5FA", 
  "Woodville Surgery, Burton Road, Woodville, DE11 7JG", 
  "Flat 1, Highcroft, 30 Old Lodge Lane, Purley, CR8 4DF", 
  "81 Wakefield Road, Streethouse, WF7 6BT", 
  "N E C House, Bickenhill Lane, Birmingham, B40 1PQ", 
  "Vaddicott Corner, Shebbear, EX21 5QT", 
  "33 Moorland Avenue, Milnrow, OL16 3DZ", 
  "Trevithal An Mor, Paul, TR19 6UQ", 
  "38 Weigall Road, London, SE12 8HE", 
  "1 Newbridge Cottages, Newbridge, PL18 9LH", 
  "122 Light Oaks Road, Salford, M6 8WL", 
  "3 Harley Way, Bridgnorth, WV16 5PA", 
  "50 Albion Crescent, Lincoln, LN1 1EB", 
  "79D Forest Road, Colchester, CO4 3XH", 
  "21 Ffordd Y Ffynnon, Bangor, LL57 1HB", 
  "3 Hollygate Close, Melton Mowbray, LE13 1HD", 
  "13 Flan Close, Ulverston, LA12 7DW", 
  "34A Salisbury Street, Amesbury, SP4 7HD", 
  "2 Palmers Lodge Cottages, Garlinge Green Road, Petham, CT4 5RL", 
  "Kerseycleugh, Kielder, NE48 1EN", 
  "The Granary, The Causeway, Mark, TA9 4QJ", 
  "80 Leamington Drive, Sutton-In-Ashfield, NG17 5BJ", 
  "6 Civic Court, Hebburn, NE31 2YB", 
  "43 Strand Meadow, Burwash, TN19 7BP", 
  "31 Pepper Hill, Northfleet, DA11 8EW", 
  "86 Church Close, Stanton By Bridge, DE73 7GH", 
  "13 Martin Close, Bedford, MK41 7JY", 
  "Mandalay, Waberthwaite, LA19 5YL", 
  "First Floor North, 10 Furnival Street, London, EC4A 1AB", 
  "10 Kammond Avenue, Seaford, BN25 3JL", 
  "Station House, Breedon Road, Worthington, LE65 1RA", 
  "Lanscove, The Coombes, Polperro, PL13 2RG", 
  "Unit 6 Mendip Vale Trading Estate, Cheddar, BS27 3EL", 
  "8C Bowes Road, Middlesbrough, TS2 1LU", 
  "3 Thicket Walk, Thornbury, BS35 2JN", 
  "21 Beech Road, East Malling, ME19 6DH", 
  "Bod Thelwal, 2 Bay View Road, Benllech, LL74 8TT", 
  "12 Stainer Close, Witham, CM8 1RU", 
  "69 Princess Way, Stourport-On-Severn, DY13 0EL", 
  "42 Patterdale Road, Blyth, NE24 5JX", 
  "30 Ollerton Road, Retford, DN22 7TQ", 
  "Ceidio Isaf, Llanerchymedd, LL71 7BH", 
  "66 Buckland Avenue, Dover, CT16 2NW", 
  "Thorne Barton Farmhouse, Chesham Road, Ashley Green, HP5 3PQ", 
  "66 Crown Road, Twickenham, TW1 3ER", 
  "4 Rossetti Court, Lyell Road, Birchington, CT7 9JE", 
  "Michelham Gate, Michelham Priory Road, Upper Dicker, BN27 3QR", 
  "1 The Old School House, Brickwall Lane, Liverpool, L29 9AD", 
  "39 Thorne Street, London, SW13 0PT",
  "168 Timken Way North, Duston, NN5 6WF", 
  "44 Blackberry Walk, Lychpit, RG24 8SN", 
  "8 Priory Road, Chilton Polden, TA7 9EH", 
  "Westwynds, Old Mains Lane, Poulton-Le-Fylde, FY6 7LA", 
  "28 Square Road, Todmorden, OL14 7SU", 
  "584 Malling Road, Kings Hill, ME19 4PU", 
  "2 Jordan Orchard, Buckfastleigh, TQ11 0NG", 
  "Old Forge, Stiffords Bridge, Cradley, WR13 5NN", 
  "9 Ball Walk, Hyde, SK14 3PY", 
  "1 Milburn Court, Brampton, CA8 1NE", 
  "7 St Michaels Close, Erith, DA18 4DY", 
  "9 Garden Court, Hanworth Road, Hampton, TW12 3EH", 
  "8 George Street, Brunswick Village, NE13 7ED", 
  "4 School Road, Hurst, RG10 0DR", 
  "117 Yonder Street, Ottery St Mary, EX11 1HH", 
  "17 Dunveth Business Park, Wadebridge, PL27 7FE", 
  "5 Suddards Fold, Bradford, BD7 3LQ", 
  "146 Park Road, Westhoughton, BL5 3DD", 
  "8 Wyedale Close, Buxton, SK17 9RF", 
  "Flat 21, Maltings Court, Hoe Lane, Ware, SG12 9LS", 
  "18 Ripley Drive, Harrogate, HG1 3JD", 
  "41 Hays Mews, London, W1J 5QA", 
  "52 St Albans Drive, Stevenage, SG1 4RU", 
  "Fields Cottage, Field Lane, Bishops Castle, SY9 5AG", 
  "3 Whinmoor Walk, Manchester, M40 5NX", 
  "The Qube, Windward Way, Middlesbrough, TS2 1QG",
  "65 Ashburnham Road, Southend-On-Sea, SS1 1QE", 
  "56A London Road, Tonbridge, TN10 3DE", 
  "49 Glentworth Gardens, Wolverhampton, WV6 0SH", 
  "16 Tarrants Hill, Hungerford, RG17 0BL", 
  "20 Lagoon Road, Bognor Regis, PO21 4TJ", 
  "24 Waterloo Street, Cheltenham, GL51 9BT", 
  "Church Farm House, Winsley, BA15 2JH", 
  "21 Stanmore Gardens, Richmond, TW9 2HN", 
  "69 Teddington Grove, Perry Barr, B42 1RG", 
  "36 Rydal Avenue, Fleetwood, FY7 7JU", 
  "Devon House, Water Street, Menai Bridge, LL59 5DD", 
  "26 Algarth Road, Pocklington, YO42 2HP", 
  "12 Bramble Gardens, Worcester, WR5 1SQ", 
  "132 Bolton Road, Turton, BL7 0AE", 
  "25 Wellfarm Close, Walton, L9 6GD", 
  "14 Swancote Green, Bracknell, RG12 7BJ", 
  "30 Commercial Street, Middlesbrough, TS2 1JW", 
  "Oakdene, Dunmow Road, Rayne, CM77 6SF", 
  "7A High Street, Eccleshall, ST21 6BW"]

# Create user profile for each of us with default pw of 'password'.
# Please amend your email if first_name.last_name@gmail.com is going to be hard to remember!
users = ['alex.terenda@gmail.com', 'jake.howlett@gmail.com', 'louis.leslie@gmail.com', 'yunus.firat@gmail.com']

# add 16 random users to have 20 users to add
16.times do
  q = Faker::TvShows::RuPaul.queen
  until q.split(" ").size == 2 && (q.include? "'") == false
    q = Faker::TvShows::RuPaul.queen
  end
  users << "#{q.split(" ")[0].downcase}.#{q.split(" ")[1].downcase}@rupaul.com"
end

# Property Types with an initial range of the number of bedrooms (source: Airbnb.com):
property_types = {"House":{"bedrooms":(2..5).to_a}, "Flat":{"bedrooms":(1..5).to_a}, "Bed and breakfast":{"bedrooms":(1..1).to_a}, "Boutique hotel":{"bedrooms":(1..1).to_a}, "Bungalow":{"bedrooms":(2..3).to_a}, "Cabin":{"bedrooms":(1..2).to_a}, "Chalet":{"bedrooms":(5..10).to_a}, "Cottage":{"bedrooms":(1..5).to_a}, "Guest house":{"bedrooms":(1..1).to_a}, "Guest suite":{"bedrooms":(1..1).to_a}, "Hostel":{"bedrooms":(1..1).to_a}, "Hotel":{"bedrooms":(1..1).to_a}, "Loft":{"bedrooms":(1..3).to_a}, "Resort":{"bedrooms":(1..2).to_a}, "Serviced apartment":{"bedrooms":(1..3).to_a}, "Townhouse":{"bedrooms":(2..5).to_a}, "Villa":{"bedrooms":(2..5).to_a}}

# Set locale to GB to get GB postcodes (not sure they are actually valid, but might be wrong!)
# Faker::Config.locale = 'en-GB'

users.each do |user|
  name = user.split("@")[0].split(".")
  u = User.create(first_name: name[0].capitalize, last_name: name[1].capitalize, email: user, password: "password", password_confirmation: "password")
  # Assign each User a random number of properties to create as a host.
  num_of_flats = (0..6).to_a.sample
  puts "Creating #{num_of_flats} properties for #{u.email}"
  num_of_flats.times do
    prop = property_types.keys.sample
    bedrooms = property_types[prop][:bedrooms].sample
    bathrooms = (1..bedrooms).to_a.sample
    name = "A #{prop} with a view of #{Faker::TvShows::GameOfThrones.city}"
    price = (bedrooms * (24..50).to_a.sample) - 0.01
    property = Property.create(user_id: u.id,
                name: name,
                property_type: prop, 
                total_occupancy: bedrooms*2, 
                total_bedrooms: bedrooms,
                total_bathrooms: bathrooms,
                price_per_night: price,
                summary: Faker::Hipster.sentences(number: 2).join("  "),
                has_kitchen: rand.round(0),
                has_tv: rand.round(0),
                has_heating: rand.round(0),
                has_internet: rand.round(0),
                has_aircon: rand.round(0),
                address: addresses.sample
              )
    addresses.delete(property.address)
    count = 0
    3.times do
      count += 1
      url = "https://source.unsplash.com/random?sig=#{rand(1..60)}/&apartment/800x600"
      file = URI.open(url)
      property.photos.attach(io: file, filename: "#{name.gsub(" ", "-")}-#{count}.jpeg", content_type: 'image/jpeg')
    end  
  end
end

15.times do
  user = User.find_by(email: users.sample)
  (3..10).to_a.sample.times do
    random_number = (0..30).to_a.sample
    random_length = (1..14).to_a.sample
    random_property = Property.all.sample
    booking = Booking.create(start_date: Date.today - random_number, end_date: Date.today - random_number + random_length, property_id: random_property.id, number_of_guests: (1..random_property.total_occupancy).to_a.sample, user_id:user.id)
    Review.create(property_id: random_property.id, content: Faker::TvShows::RuPaul.quote, rating: (1..5).to_a.sample, booking_id: booking.id)
  end
  # Faker::TvShows::RuPaul.quote
end

