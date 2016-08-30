require 'spec_helper'

describe Property do

  context 'when creating' do
    subject {Property.new(property_type: 'BLAH')}

    it { expect(subject).to require_enum_value :property_type }

    context 'when requiring attributes' do
      subject { Property.new }

      it { expect(subject).to require_attribute :address }
      it { expect(subject).to require_attribute :city }
      it { expect(subject).to require_attribute :state }
      it { expect(subject).to require_attribute :postal_code }
      it { expect(subject).to require_attribute :price }
      it { expect(subject).to require_attribute :bedrooms }
      it { expect(subject).to require_attribute :bathrooms }
      it { expect(subject).to require_attribute :livable_area_square_feet }
      it { expect(subject).to require_attribute :title }
      it { expect(subject).to require_attribute :description }
      it { expect(subject).to require_attribute :property_type }
    end

    context 'when validating attribute types' do
      subject { Property.new(postal_code: 234, price: 10000000000, bedrooms: 2.1, bathrooms: 5.6, livable_area_square_feet: 432.23, land_size_acres: -2)}

      it { expect(subject).to validate_length_attribute :postal_code, 5 }
      it { expect(subject).to validate_generic_attribute :price, 'must be a positive amount below $10,000,000,000' }
      it { expect(subject).to validate_integer_attribute :bedrooms }
      it { expect(subject).to validate_integer_attribute :bathrooms }
      it { expect(subject).to validate_integer_attribute :livable_area_square_feet }
      it { expect(subject).to validate_generic_attribute :land_size_acres, 'must be greater than or equal to 0' }
    end

    context 'when validating state' do
      subject { Property.new state: 'Minnesota'}

      it { expect(subject).to validate_generic_attribute :state, 'must be the two letter abbreviation'}
    end
  end

  context 'when accessing coordinates' do
    let(:property) { create(:property, latitude: nil, longitude: nil) }

    it 'generates the latitude before save' do
      expect(property.latitude).to eq 40.7077299
    end

    it 'generates the longitude before save' do
      expect(property.longitude).to eq -74.0097298
    end
  end

  context 'when generating full street address' do
    let(:property) { build(:property, address: "20 Pine St 1710", city: "New York", state: State.find_key(:ny), postal_code: 10005, latitude: nil, longitude: nil) }

    it 'combines address values' do
      expect(property.full_street_address).to eq "20 Pine St 1710 New York, NY 10005 US"
    end
  end
end
