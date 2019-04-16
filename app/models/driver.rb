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

  def first_published
    books_with_year = self.books.where.not(publication_date: nil)
    first_book = books_with_year.order(publication_date: :asc).first
    return first_book.publication_date
  end
end
