require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:color)}
    it { should validate_presence_of(:doors)}
  end

  describe "relationships" do
    it {should belong_to(:maker)}
  end

  describe "class methods" do
    it "sorts by alpha" do
      toyota = Maker.create!(name: "Toyota", domestic: false, year_founded: 1937)
      @camry = toyota.cars.create!(name: "Camry", color: "grey", doors: 4, in_production: true)
      @fortuner = toyota.cars.create!(name: "Fortuner", color: "silver", doors: 4, in_production: true)
      @bandeirante = toyota.cars.create!(name: "Bandeirante", color: "tan", doors: 2, in_production: false)
      cars = Car.all
      expect(cars).to eq([@camry, @fortuner, @bandeirante])
      cars_sorted = cars.sort_by_alpha
      expect(cars_sorted).to eq([@bandeirante, @camry, @fortuner])
    end
  end
end
