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
  latitude: 40.7077339,
  longitude: -74.0119185)

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
  latitude: 45.7241647,
  longitude: -94.4779575)
