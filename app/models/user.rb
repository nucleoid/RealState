class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable

  before_validation :default_role, :ensure_authentication_token

  validates :role, presence: true, inclusion: { in: Role.keys }
  validates :api_auth_token, presence: true, length: { is: 20 }

  def is_agent?
    [Role.find_key(:admin), Role.find_key(:agent)].include?(self.role)
  end

  def is_admin?
    Role.find_key(:admin) == self.role
  end

  def ensure_authentication_token
    if self.api_auth_token.blank?
      self.api_auth_token = generate_authentication_token
    end
  end

  private

  def default_role
    if self.role.blank?
      self.role = Role.find_key(:customer_user)
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token(20)
      break token unless User.where(api_auth_token: token).first
    end
  end
end
