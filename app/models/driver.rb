class Driver < ApplicationRecord
  has_many :trips

  validates :vin, presence: true, uniqueness: true
  validates :name, presence: true
end
