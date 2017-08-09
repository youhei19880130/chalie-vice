class Maker < ApplicationRecord
  has_many :items

  scope :sorted_by, -> (sort_key) { order(sort_key) }
  scope :search_query, -> (query) { where('name LIKE (?)', "%#{query}%").or(where('person LIKE (?)', "%#{query}%"))}

  filterrific(
    default_filter_params: { sorted_by: 'id' },
    available_filters: [
        :sorted_by,
        :search_query,
      ]
  )

  enum ship_from_location: {
    maker: 1,
    arts: 2,
  }
end
