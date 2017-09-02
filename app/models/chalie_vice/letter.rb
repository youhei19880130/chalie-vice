class ChalieVice::Letter < ApplicationRecord
  mount_uploader :thumb_image, ImageUploader
  has_many :items, through: :letter_item
  has_many :letter_items, dependent: :destroy
end
