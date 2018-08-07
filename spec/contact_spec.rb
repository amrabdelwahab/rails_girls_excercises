# frozen_string_literal: true

require './app/contact'

describe Contact do
  let(:contact) { described_class.new(name, numbers) }
  let(:name) { 'amr' }
  let(:numbers) { [] }

  describe '#add_number' do
    subject { contact.add_number(number_to_add) }

    let(:number_to_add) { '********' }

    it 'should add the phone number to the contact numbers' do
      expect { subject }
        .to change { contact.numbers }
        .from([])
        .to(['********'])
    end

    context 'when number to add is an array of numbers' do
      let(:number_to_add) { ['123', '456'] }

      it 'should add the phone number to the contact numbers' do
        expect { subject }
          .to change { contact.numbers }
          .from([])
          .to(['123', '456'])
      end
    end
  end

  describe 'valid?' do
    subject { contact }

    context 'when numbers are not empty' do
      let(:numbers) { ['********'] }

      it { is_expected.to be_valid }
    end

    context 'when numbers are still empty' do
      it { is_expected.not_to be_valid }
    end

    context 'when numbers are not empty but the name is blank' do
      let(:numbers) { ['********'] }
      let(:name) { '' }

      it { is_expected.not_to be_valid }
    end

    context 'when numbers are not empty but the name is nil' do
      let(:numbers) { ['********'] }
      let(:name) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when numbers are not empty but the name is only spaces' do
      let(:numbers) { ['********'] }
      let(:name) { '    ' }

      it { is_expected.not_to be_valid }
    end
  end

  describe '#merge!' do
    subject { contact.merge!(other_contact) }

    let(:other_contact) { Contact.new(other_name, ['123', '456']) }

    context 'when other contact name is the same' do
      let(:other_name) { name }

      it 'merges the two contact numbers' do
        expect { subject }
          .to change { contact.numbers }
          .from([])
          .to(['123', '456'])
      end
    end



    context 'when other contact name is not the same' do
      let(:other_name) { 'other_name' }

      it 'does not change the original contact numbers' do
        expect { subject }
          .not_to change { contact.numbers }
      end
    end
  end
end
