class ChalieVice::Letter < ApplicationRecord
  has_many :items, through: :letter_item
  has_many :letter_items, dependent: :destroy
end
