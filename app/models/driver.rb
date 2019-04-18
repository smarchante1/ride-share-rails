class Driver < ApplicationRecord
  has_many :trips

  validates :vin, presence: true, uniqueness: true
  validates :name, presence: true

  def total_earnings
    fee = 165
    percentage = 0.80
    total = (self.trips.sum { |trip| trip.cost - fee } * percentage) / 100
    return "$#{total.round(2)}"
  end

  def average_rating
    not_nil = self.trips.find_all { |trip| !trip.rating.nil? }
    return 1.0 * not_nil.sum { |trip| trip.rating } / not_nil.length
  end
end
