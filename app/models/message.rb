class Message < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  
  mount_uploader :image, ImageUploader

  validates :content, presence: true, unless: :image?
end
