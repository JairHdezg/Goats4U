class Goat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo
  has_many :reviews, dependent: :destroy, through: :rentals

  validates :name, presence: :true
  validates :photo, presence: :true

  def unavailable_dates
    rentals.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def average
    if self.reviews.length > 0
      sum = 0
      self.reviews.each do |review|
        sum += review.rating
      end
      return sum / self.reviews.length
    else
      return 0
    end
  end
end
