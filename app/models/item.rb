class Item < ApplicationRecord
  belongs_to :maker

  scope :sorted_by, -> (sort_key) { order(sort_key) }
  scope :search_query, -> (query) { where('items.name LIKE (?)', "%#{query}%")
                                    .or(where('makers.name LIKE (?)', "%#{query}%"))
                                    .or(where('category LIKE (?)', "%#{query}%")).joins(:maker)}

  filterrific(
    default_filter_params: { sorted_by: 'id' },
    available_filters: [
        :sorted_by,
        :search_query,
      ]
  )
end
