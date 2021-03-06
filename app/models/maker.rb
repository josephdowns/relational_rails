class Maker < ApplicationRecord
  has_many :cars, dependent: :delete_all
  validates_presence_of :name
  validates_presence_of :year_founded

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def cars_count
    cars.count
  end

  def sort_by_doors(input)
    cars.where("doors > #{input}")
  end

end
