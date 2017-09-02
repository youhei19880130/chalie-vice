class ChalieVice::Item < ApplicationRecord
  has_many :item_images
  has_many :letters, through: :letter_item
  has_many :letter_items, dependent: :destroy
end
