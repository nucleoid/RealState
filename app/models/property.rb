class Property < ApplicationRecord

  serialize :features, JSON

  validates :property_type, presence: true, :inclusion => { in: PropertyType.keys }

   def maps_hash
     Gmaps4rails.build_markers([self]) do |prop, marker|
       marker.lat prop.latitude
       marker.lng prop.longitude
     end
   end
end
