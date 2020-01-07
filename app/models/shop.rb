class Shop < ApplicationRecord
  belongs_to :user
  # has_many :noodle_images, dependent: :destroy

  validates :name,  presence: true
  validates :address,  presence: true
  validates :map,  presence: true
  validates :horiday,  presence: true
  validates :opening_hours,  presence: true
  validates :menu,  presence: true


end
