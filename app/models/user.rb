class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :visit_counts, dependent: :destroy
  # has_many :shops

  validates :nickname,  presence: true, uniqueness: true

end
