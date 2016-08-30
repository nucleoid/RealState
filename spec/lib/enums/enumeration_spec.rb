require 'spec_helper'

describe Enumeration do

  it 'increments id' do
    expect { Enumeration.add :increment_id }.to change { Enumeration.instance_variable_get(:@id) }
  end

  it 'raises error when adding existing value' do
    Enumeration.add :existing_value
    expect { Enumeration.add :existing_value }.to raise_error(ArgumentError)
  end

  it 'becomes an array of descriptions' do
    Enumeration.add :ONE, { description: 'One' }
    Enumeration.add :TWO, { description: 'Two' }
    expect(Enumeration.to_a).to include('One')
    expect(Enumeration.to_a).to include('Two')
  end

  it 'becomes an array of values' do
    Enumeration.add :JANUARY, { description: 'Jan.' }
    Enumeration.add :FEBRUARY, { description: 'Feb.' }
    expect(Enumeration.to_a(:use => :val)).to include('JANUARY')
    expect(Enumeration.to_a(:use => :val)).to include('FEBRUARY')
  end

  it 'retrieves key' do
    Enumeration.add :retrieve_key
    expect(Enumeration.find_key(:retrieve_key)).to eq "RETRIEVE_KEY"
  end

  it 'retrieves default display name' do
    Enumeration.add :default_key
    expect(Enumeration.find_key(:default_key)).to eq "DEFAULT_KEY"
  end

  it 'retrieves key with spaces replaced' do
    Enumeration.add :retrieve_key_spaced
    expect(Enumeration.find_key('retrieve key spaced')).to eq "RETRIEVE_KEY_SPACED"
  end

  it 'retrieves key from description' do
    Enumeration.add :retrieve_key_described, { description: 'This is described' }
    expect(Enumeration.find_key('This is described')).to eq "RETRIEVE_KEY_DESCRIBED"
  end

  it 'retrieves key from partial case-insensitive description' do
    Enumeration.add :retrieve_key_partial_described, { description: 'This is Partially described' }
    expect(Enumeration.find_key('partial')).to eq "RETRIEVE_KEY_PARTIAL_DESCRIBED"
  end

  it 'retrieves custom display name' do
    Enumeration.add :key_with_custom_desc, { desc: 'Hey There' }
    expect(Enumeration.display_name(:key_with_custom_desc, :desc)).to eq 'Hey There'
  end

  it 'retrieves custom display name with nil' do
    expect(Enumeration.display_name(nil)).to be_nil
  end

  it 'retrieves custom display name with empty' do
    expect(Enumeration.display_name('')).to eq ''
  end

  it 'retrieves custom display name with unrelated key' do
    Enumeration.add :related_key, { desc: 'Hey There' }
    expect(Enumeration.display_name(:unrelated_key, :desc)).to eq :UNRELATED_KEY
  end

  it 'retrieves description' do
    Enumeration.add :key_with_description, { description: 'Hey There' }
    expect(Enumeration.description_for(:key_with_description)).to eq 'Hey There'
  end

  it 'has keys' do
    Enumeration.add :has_keys
    expect(Enumeration.keys).to include("HAS_KEYS")
  end
end
