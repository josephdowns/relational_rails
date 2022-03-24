class Maker < ApplicationRecord
  has_many :cars
  validates_presence_of :name
  validates_presence_of :year_founded
end
