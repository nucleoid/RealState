require 'rails_helper'

RSpec.describe Image, type: :model do
  context 'when creating' do
    subject {Image.new(url: 'BLAH')}

    context 'when requiring attributes' do
      subject { Image.new }

      it { expect(subject).to require_attribute :url }
    end

    context 'when validating attribute types' do
      subject { Image.new(url: 'not a url')}

      it { expect(subject).to validate_url_attribute :url }
    end
  end

  context 'when marking an image as featured' do
    let(:property) { create(:property, images: []) }
    let(:image1) { build(:image, url: 'http://one.com/image/png')}
    let(:image2) { build(:image_featured, url: 'http://two.com/image/png')}
    let(:image3) { build(:image, url: 'http://three.com/image/png')}
    before do
      property.images << image1
      property.images << image2
      property.images << image3
    end

    it 'marks all other property images as not featured' do
      image3.update(is_featured: true)
      expect(image1.reload.is_featured?).to be_falsey      #had to reload because of the update_all usage
      expect(image2.reload.is_featured?).to be_falsey
    end
  end
end
