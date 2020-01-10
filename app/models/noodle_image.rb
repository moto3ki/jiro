class NoodleImage < ApplicationRecord
  belongs_to :shop, inverse_of: :noodle_images

  mount_uploader :image, ImageUploader

  validates :image,  presence: true


end
