class Goat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :rentals
  has_one_attached :photo
  has_many :reviews, through: :rentals

  validates :name, presence: :true

  def unavailable_dates
    rentals.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
