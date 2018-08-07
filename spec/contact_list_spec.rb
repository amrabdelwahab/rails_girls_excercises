# frozen_string_literal: true

require './app/contact_list'

describe ContactList do
  let(:contact_list) { described_class.new(initial_contacts) }
  let(:initial_contacts) { [] }

  describe '#add_contact' do
    subject { contact_list.add_contact(contact_to_add) }

    let(:contact_to_add) { Contact.new('amr', ['********']) }

    it 'adds the contact to the contact list contacts array' do
      expect { subject }
        .to change { contact_list.contacts }
        .from([])
        .to([contact_to_add])
    end

    context 'when a contact with the same name exists' do
      let(:initial_contacts) { [existing_contact] }
      let(:existing_contact) { Contact.new('amr', ['12345']) }

      it 'merges the two contacts' do
        expect { subject }
          .to change { existing_contact.numbers }
          .from(['12345'])
          .to(['12345', '********'])

        expect { subject }
          .not_to change { contact_list.contacts.size }
      end
    end
  end

  describe '#search' do
    subject { contact_list.search(key) }

    let(:initial_contacts) { [existing_contact] }
    let(:existing_contact) {  Contact.new('amr', ['12345']) }


    context 'when key exists' do
      let(:key) { 'amr' }

      it { is_expected.to eq existing_contact }
    end

    context 'when key does not exist' do
      let(:key) { 'non_existent' }

      it { is_expected.to be_nil }
    end
  end
end
