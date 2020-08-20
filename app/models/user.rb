class User < ApplicationRecord
  has_many :goats, dependent: :destroy
  has_many :rentals
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :photo, presence: true
end
