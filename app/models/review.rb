class Review < ApplicationRecord
  belongs_to :rental
  has_one :goat, through: :rental
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
