class Maker < ApplicationRecord
  scope :sorted_by, -> (sort_key) { order(sort_key) }
  scope :search_query, -> (query) { where('name LIKE (?)', "%#{query}%").or(where('person LIKE (?)', "%#{query}%"))}

  filterrific(
    default_filter_params: { sorted_by: 'id' },
    available_filters: [
        :sorted_by,
        :search_query,
      ]
  )
end
