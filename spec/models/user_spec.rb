require 'rails_helper'

RSpec.describe User, type: :model do

  context 'when creating' do
    subject {User.new(role: 'BLAH', api_auth_token: 'ljklj')}

    it { expect(subject).to require_enum_value :role }
    it { expect(subject).to validate_length_attribute :api_auth_token, 20 }

    it 'sets a default role' do
      user = User.new
      user.valid?
      expect(user.role).to eq Role.find_key(:customer_user)
    end

    it 'sets an api auth token' do
      user = User.new
      user.valid?
      expect(user.api_auth_token.length).to eq 20
    end

    context 'when requiring attributes' do
      subject { User.new }

      it { expect(subject).to require_attribute :email }  #Devise apparently takes care of this validation
    end
  end

  context 'when checking roles' do

    it 'customer user checks for an agent' do
      expect(User.new(role: Role.find_key(:customer_user)).is_agent?).to be_falsey
    end

    it 'customer user checks for an admin' do
      expect(User.new(role: Role.find_key(:customer_user)).is_agent?).to be_falsey
    end

    it 'agent checks for an admin' do
      expect(User.new(role: Role.find_key(:agent)).is_admin?).to be_falsey
    end

    it 'agent checks for an agent' do
      expect(User.new(role: Role.find_key(:agent)).is_agent?).to be_truthy
    end

    it 'admin checks for an admin' do
      expect(User.new(role: Role.find_key(:admin)).is_admin?).to be_truthy
    end

    it 'admin checks for an agent' do
      expect(User.new(role: Role.find_key(:admin)).is_agent?).to be_truthy
    end
  end
end