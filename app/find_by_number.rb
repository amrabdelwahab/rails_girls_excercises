# frozen_string_literal: true


# def find_by_number(number, contact_list)
#   contact_list.select { |k,v| v == number }.keys.first || 'No contact found'
# end

def find_by_number(number, contact_list)
  contact_list.key(number) || 'No contact found'
end
