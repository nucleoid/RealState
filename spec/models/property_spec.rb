require 'spec_helper'

describe Property do

  context 'when creating' do
    subject {Property.new(property_type: 'BLAH')}

    it { expect(subject).to require_enum_value :property_type }

    context 'when requiring attributes' do
      subject { Property.new }

      it { expect(subject).to require_attribute :property_type }
    end
  end

  context 'when mapping coordinates to a hash' do
    let(:property) { build(:property, latitude: 40.7077339, longitude: -74.0119185) }

    it 'maps the location hash' do
      expect(property.maps_hash).to eq [{lat: BigDecimal.new(40.707734, 9), lng: BigDecimal.new(-74.011919, 9)}]
    end
  end
end
