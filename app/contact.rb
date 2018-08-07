# frozen_string_literal: true

class Contact
  attr_accessor :name, :numbers

  def initialize(name, numbers=[])
    @name = name
    @numbers = numbers
  end

  def add_number(number_to_add)
    numbers << number_to_add
    numbers.flatten!
  end

  def valid?
    numbers.any? && !name.to_s.strip.empty?
  end

  def merge!(other_contact)
    return unless other_contact == self
    add_number(other_contact.numbers)
  end

  def ==(other_contact)
    other_contact.name == name
  end
end
