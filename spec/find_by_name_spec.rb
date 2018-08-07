# frozen_string_literal: true

require './app/find_by_name'

describe '#find_by_name' do

  subject { find_by_name(name, contact_list) }

  let(:contact_list) do
    {
      amr: '+49xxxx',
      gui: '+201****',
      anna: '+3*****'
    }
  end

  context 'when name does not exist in contact list' do
    let(:name) { 'non_existing_key' }

    it { is_expected.to eq 'No Number found' }
  end

  context 'when name exists in contact list' do
    let(:name) { :amr }

    it { is_expected.to eq '+49xxxx' }
  end

  context 'when name exists in contact list but not a symbol' do
    let(:name) { 'amr' }

    it { is_expected.to eq '+49xxxx' }
  end
end
