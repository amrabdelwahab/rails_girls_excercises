# frozen_string_literal: true

require './app/find_by_number'

describe '#find_by_number' do

  subject { find_by_number(number, contact_list) }

  let(:contact_list) do
    {
      amr: '+49xxxx',
      gui: '+201****',
      anna: '+3*****'
    }
  end

  context 'when number does not exist in contact list' do
    let(:number) { 'non_existing_number' }

    it { is_expected.to eq 'No contact found' }
  end

  context 'when number exists in contact list' do
    let(:number) { '+49xxxx' }

    it { is_expected.to eq :amr }
  end
end
