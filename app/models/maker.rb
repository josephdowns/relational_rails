class Maker < ApplicationRecord
  has_many :cars
  validates_presence_of :name
  validates_presence_of :year_founded

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def cars_count
    cars.count
  end

end
