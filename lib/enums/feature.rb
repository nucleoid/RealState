class Feature < Enumeration
  self.add :POOL, { description: 'Single apartment unit' }
  self.add :LAUNDRY, { description: 'Detached home' }
  self.add :GARAGE, { description: 'Covered garage' }
  self.add :CORNER_LOT, { description: 'Desirable corner lot' }
end