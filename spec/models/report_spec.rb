require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'when creating' do
    context 'when requiring attributes' do
      let(:bad_name) { build(:report, name: 'This is a big report!') }
      let(:bad_name2) { build(:report, name: 'This is a big report #2 ') }
      let(:bad_name3) { build(:report, name: 'This is a _ big report') }
      subject { Report.new }

      it { expect(subject).to require_attribute :name }
      it { expect(subject).to require_attribute :sql_query }

      it 'only allows letters and spaces for name' do
        expect(bad_name).to validate_generic_attribute :name, 'must only contain alphanumeric characters and spaces'
        expect(bad_name2).to validate_generic_attribute :name, 'must only contain alphanumeric characters and spaces'
        expect(bad_name3).to validate_generic_attribute :name, 'must only contain alphanumeric characters and spaces'
      end
    end
  end

  context 'when running the report' do
    let(:report) { build(:report, sql_query: 'select title, bedrooms from properties where is_sold=1')}
    before do
      create(:property, is_sold: false)
      create(:property, is_sold: true)
      create(:property, is_sold: true)
      create(:property, is_sold: false)
      create(:property, is_sold: true)
      report.run_report
    end

    it 'returns the sql query results' do
      expect(report.results.rows.size).to eq 3
    end

    it 'returns the column names' do
      expect(report.columns).to eq ['Title', 'Bedrooms']
    end

    it 'returns the values' do
      expect(report.values).to eq [['Steps to the city', "1"], ['Steps to the city', "1"], ['Steps to the city', "1"]]
    end
  end
end
