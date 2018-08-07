# frozen_string_literal: true


def find_by_name(name, contact_list)
  contact_list.fetch(name.to_sym, 'No Number found')
end
