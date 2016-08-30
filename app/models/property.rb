class Property < ApplicationRecord

  serialize :features, JSON

  geocoded_by :full_street_address
  before_save :geocode

  validates :address, presence: true
  validates :city, presence: true
  validates :region, presence: true, length: { is: 2, message: 'must be the two letter abbreviation'}
  validates :postal_code, presence: true, numericality: { only_integer: true }, length: {is: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10000000000, :message => 'must be a positive amount below $10,000,000,000' }
  validates :bedrooms, presence: true, numericality: { only_integer: true }
  validates :bathrooms, presence: true, numericality: { only_integer: true }
  validates :livable_area_square_feet, presence: true, numericality: { only_integer: true }
  validates :land_size_acres, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :title, presence: true
  validates :description, presence: true
  validates :property_type, presence: true, inclusion: { in: PropertyType.keys }


  def maps_hash
     Gmaps4rails.build_markers([self]) do |prop, marker|
       marker.lat prop.latitude
       marker.lng prop.longitude
       marker.infowindow full_street_address
     end
  end

  def full_street_address
    "#{address} #{city}, #{region} #{postal_code} US"
  end
end
