class Property < ApplicationRecord

  serialize :features, JSON
  geocoded_by :full_street_address

  has_many :images

  before_save :geocode

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2, message: 'must be the two letter abbreviation'}
  validates :postal_code, presence: true, numericality: { only_integer: true }, length: {is: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10000000000, :message => 'must be a positive amount below $10,000,000,000' }
  validates :bedrooms, presence: true, numericality: { only_integer: true }
  validates :bathrooms, presence: true, numericality: { only_integer: true }
  validates :livable_area_square_feet, presence: true, numericality: { only_integer: true }
  validates :land_size_acres, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :title, presence: true
  validates :description, presence: true
  validates :property_type, presence: true, inclusion: { in: PropertyType.keys }

  def full_street_address
    "#{address} #{city}, #{state} #{postal_code} US"
  end

  def featured_image
    if self.images.any?
      self.images.select {|i| i.is_featured?}.first || self.images.first
    else
      Image.new(url: 'default_featured_image.png')
    end
  end
end
