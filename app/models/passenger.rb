class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  def total_charges
    return (self.trips.sum { |trip| trip.cost }) / 100
  end
end
