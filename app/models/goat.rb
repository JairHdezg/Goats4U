class Goat < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :name, presence: :true
end
