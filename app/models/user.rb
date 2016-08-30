class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable

  before_validation :default_role

  validates :role, presence: true, inclusion: { in: Role.keys }

  def is_agent?
    [Role.find_key(:admin), Role.find_key(:agent)].include?(self.role)
  end

  def is_admin?
    Role.find_key(:admin) == self.role
  end

  private

  def default_role
    self.role ||= Role.find_key(:customer_user)
  end
end
