class Goat < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo
  
  validates :name, presence: :true
end
