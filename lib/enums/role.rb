class Role < Enumeration
  self.add :ADMIN, { description: 'Administrator' }
  self.add :AGENT, { description: 'Agent' }
  self.add :CUSTOMER_USER, { description: 'Customer user' }
end