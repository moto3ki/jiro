class Shop < ApplicationRecord
  belongs_to :user
  has_many :noodle_images, dependent: :destroy, inverse_of: :shop
  accepts_nested_attributes_for :noodle_images
  has_many :messages, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  mount_uploader :map, ImageUploader

  validates :name,  presence: true
  validates :address,  presence: true
  validates :map,  presence: true
  validates :horiday,  presence: true
  validates :opening_hours,  presence: true
  validates :menu,  presence: true

  validates :noodle_images,  presence: true


end
