class ChalieVice::ItemImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item
  belongs_to :letter
end
