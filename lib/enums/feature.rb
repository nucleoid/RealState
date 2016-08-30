class Feature < Enumeration
  self.add :POOL, { description: 'Pool Available' }
  self.add :WHIRLPOOL, { description: 'Whirlpool Available' }
  self.add :LAUNDRY, { description: 'Laundry on Premises' }
  self.add :GARAGE, { description: 'Covered Garage' }
  self.add :CORNER_LOT, { description: 'Desirable Corner Lot' }
  self.add :ENSUITE, { description: 'Ensuite Master Bedroom'}
  self.add :CENTRAL_AC, { description: 'Central Air Conditioning'}
  self.add :FORCED_HEAT, { description: 'Forced Air Heating'}
  self.add :HARDWOOD, { description: 'Hardwood Floors'}
  self.add :TILE, { description: 'Tile Floors'}
  self.add :SECURITY, { description: 'Security System'}
  self.add :CABLE_SATELLITE, { description: 'Cable or Satellite TV'}
  self.add :INTERNET, { description: 'High Speed Internet'}
  self.add :FULL_KITCHEN, { description: 'Fully-Stocked Kitchen'}
  self.add :SPRINKLER, { description: 'Automatic Sprinkler System'}
end