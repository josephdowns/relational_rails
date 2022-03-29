class Car < ApplicationRecord
  belongs_to :maker
  validates_presence_of :name
  validates_presence_of :color
  validates_presence_of :doors

  def self.in_production
    where(in_production: true)
  end

  def self.sort_by_alpha
    self.order(:name)
  end
end
