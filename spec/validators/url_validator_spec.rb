require 'spec_helper'

describe UrlValidator do

  context 'When a valid url is given' do

    it { expect(TestRecord.new(:url => 'https://twitter.com')).to allow_valid_attribute :url }
    it { expect(TestRecord.new(:url => 'https://www.twitter.com')).to allow_valid_attribute :url }
    it { expect(TestRecord.new(:url => 'http://twitter.com.au')).to allow_valid_attribute :url }
    it { expect(TestRecord.new(:url => 'http://subdomain.twitter')).to allow_valid_attribute :url }
    it { expect(TestRecord.new(:url => 'https://twitter.com/search?q=green%20bay%20packers')).to allow_valid_attribute :url }
    it { expect(TestRecord.new(:url => 'http://twitter.com/mstatz')).to allow_valid_attribute :url }
    it { expect(TestRecord.new(url: 'http://pixel.quantserve.com/r;a=p-DfVY3P9gvt5qp;labels=_click.adserver.doubleclick*http://www.facebook.com/Biscoff/app_376135842503871')).to allow_valid_attribute :url }
    it { expect(TestRecord.new(url: 'https://www.dunkindonuts.com/content/dunkindonuts/en/menu/food/bakery/donuts/donuts.html?DRP_FLAVOR=French+Cruller')).to allow_valid_attribute :url }
  end

  context 'When an invalid url is given' do
    it { expect(TestRecord.new(:url => 'twitter.com')).to validate_url_attribute :url }
    it { expect(TestRecord.new(:url => 'ftp://www.twitter.com')).to validate_url_attribute :url }
    it { expect(TestRecord.new(:url => '//twitter.com')).to validate_url_attribute :url }
  end

  context 'When an empty url is given' do
    it { expect(TestRecord.new(:url => '')).to allow_valid_attribute :url }
  end

  context 'When a nil url is given' do
    it { expect(TestRecord.new(:url => nil)).to allow_valid_attribute :url }
  end

  class TestRecord
    include ActiveModel::Validations

    validates :url, url: true

    attr_accessor :url

    def initialize(attributes = {}, options = {})
      attributes.each do |key, value|
        self.send("#{key}=", value)
      end
    end
  end
end