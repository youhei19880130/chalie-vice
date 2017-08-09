class Item < ApplicationRecord
  belongs_to :maker
  has_many :orders, primary_key: :chalievice_item_id, foreign_key: :chalievice_item_id

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

  enum ship_from_location: {
    no_select: 0,
    maker: 1,
    arts: 2,
  }
end
