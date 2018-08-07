# frozen_string_literal: true

class ContactList
  attr_accessor :contacts

  def initialize(contacts=[])
    @contacts = contacts
  end

  def add_contact(contact_to_add)
    existing_contact = search(contact_to_add.name)
    return existing_contact.merge!(contact_to_add) if existing_contact

    contacts << contact_to_add
  end

  def search(key)
    contacts.find do |contact|
      contact.name == key
    end
  end
end
