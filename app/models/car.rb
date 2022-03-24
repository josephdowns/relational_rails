class Car < ApplicationRecord
  belongs_to :maker
  validates_presence_of :name
  validates_presence_of :color
  validates_presence_of :doors
end
