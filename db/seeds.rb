# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.create(
  address: "20 Pine St 1710",
  city: "New York",
  region: "NY",
  postal_code: 10005,
  price: 122500.00,
  bedrooms: 1,
  bathrooms: 1,
  livable_area_square_feet: 1100,
  land_size_acres: 0.15 ,
  title: "Steps to the city",
  description: "Step in to this giant loft with a little over 1100 sf and immediately you will begin to the feel generous and spacious layout.",
  property_type: :APARTMENT,
  features: [:POOL, :LAUNDRY],
  latitude: nil,
  longitude: nil,
  is_sold: false)

Property.create(
  address: "111 Main St",
  city: "Holdingford",
  region: "MN",
  postal_code: 56340,
  price: 189000.00,
  bedrooms: 4,
  bathrooms: 2,
  livable_area_square_feet: 1500,
  land_size_acres: 1.5,
  title: "Small town corner",
  description: "This lovely city corner lot has great access to the town and views of the country side.",
  property_type: :DETACHED_HOME,
  features: [:LAUNDRY, :GARAGE, :CORNER_LOT],
  latitude: nil,
  longitude: nil,
  is_sold: true)

Property.create(
    address: "1965 Moorhead Rd",
    city: "Cloquet",
    region: "MN",
    postal_code: 55720,
    price: 339000.00,
    bedrooms: 4,
    bathrooms: 4,
    livable_area_square_feet: 3592,
    land_size_acres: .35,
    title: "Stunning home located on over 6 acres!",
    description: "Enjoy this 4 bedroom, 4 bathroom, 2+ car heated attached garage. The main floor features 9' ceilings and includes a bedroom, 3/4 bath, large living room with french doors & gas fireplace, gorgeous kitchen with double hung ovens, gas stove top, center island, formal dining room, and a laundry room. The second floor has 3 bedrooms and 2 full baths. The master suite has vaulted ceilings and walk in tiled shower, double sink vanity(knotty alder), huge walk-in closet. The lower level walkout has 9' ceilings and is finished with a family room including a fireplace and french doors, 1/2 bath, storage room, and utility room. There is in-floor heat throughout the house and garage.",
    property_type: :DETACHED_HOME,
    features: [:LAUNDRY, :GARAGE, :CORNER_LOT],
    latitude: nil,
    longitude: nil,
    is_sold: true)

Property.create(
    address: "114 Chase Ave",
    city: "Nicollet",
    region: "MN",
    postal_code: 56074,
    price: 249000.00,
    bedrooms: 3,
    bathrooms: 2,
    livable_area_square_feet: 1650,
    land_size_acres: 1,
    title: "New construction",
    description: "Located in Nicollet by the walking trails to school! 3 bedroom, 2 bathrooms. 1650 Sq ft. on the main floor. Basement unfinished. Gas fireplace, whirlpool tub in master, vaulted ceilings.",
    property_type: :DETACHED_HOME,
    features: [:LAUNDRY, :GARAGE, :CORNER_LOT, :CENTRAL_AC],
    latitude: nil,
    longitude: nil,
    is_sold: false)

Property.create(
    address: "209 N Grant St",
    city: "Taunton",
    region: "MN",
    postal_code: 56291,
    price: 165000.00,
    bedrooms: 3,
    bathrooms: 3,
    livable_area_square_feet: 2898,
    land_size_acres: 2,
    title: "Truly a sight to behold",
    description: "Original home totally updated w/new addition to meet your every need! New plumbing, wiring, insulation, shingles, siding, windows, flooring amazing baths & kitchen. Spacious lot includes Quonset garage/shop mature trees, asparagus and apple trees. Beautiful new kitchen is plumbed & wired for island. Two zone HVAC for comfort & efficiency. Basement is ready to finish as family room or billiards. Lots of storage in updated, clean & welcoming basement will be one more great surprise in this home. Don't miss your chance to drive by and appreciate the curb appeal- new landscaping and front porch are highlights. Make as appointment for interior viewing & check out the office or main floor bedroom, open concept living, dining and kitchen, handy back foyer/laundry. ",
    property_type: :DETACHED_HOME,
    features: [:LAUNDRY, :GARAGE, :CORNER_LOT],
    latitude: nil,
    longitude: nil,
    is_sold: false)

Report.create(name: "All Properties", sql_query: "select id, address, city, region as state, postal_code, price, CASE is_sold WHEN 1 THEN 'yes' ELSE 'no' END as is_sold from properties;")
Report.create(name: "Sold Properties", sql_query: "select id, address, city, region as state, postal_code, price, CASE is_sold WHEN 1 THEN 'yes' ELSE 'no' END as is_sold from properties where is_sold=1;")
Report.create(name: "Unsold Properties", sql_query: "select id, address, city, region as state, postal_code, price, CASE is_sold WHEN 1 THEN 'yes' ELSE 'no' END as is_sold from properties where is_sold=0 or is_sold is null;")
Report.create(name: "Cheap Properties", sql_query: "select id, address, city, region as state, postal_code, price, CASE is_sold WHEN 1 THEN 'yes' ELSE 'no' END as is_sold from properties where price < 200000;")
Report.create(name: "Expensive Properties", sql_query: "select id, address, city, region as state, postal_code, price, CASE is_sold WHEN 1 THEN 'yes' ELSE 'no' END as is_sold from properties where price >= 200000;")
Report.create(name: "All Users", sql_query: "select id, email, role from users where role='ADMIN';")
Report.create(name: "Admin Users", sql_query: "select id, email, role from users where role='ADMIN';")
Report.create(name: "Agent Users", sql_query: "select id, email, role from users where role='AGENT';")
Report.create(name: "Customer Users", sql_query: "select id, email, role from users where role='CUSTOMER_USER';")
