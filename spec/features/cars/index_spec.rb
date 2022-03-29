require 'rails_helper'

RSpec.describe "car index page", type: :feature do
  before (:each) do
    @maker = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    @car_1 = Car.create!(name: "Durango", color: "black", doors: 4, in_production: true, maker_id: @maker.id)
    @car_2 = Car.create!(name: "Aries", color: "beige", doors: 2, in_production: false, maker_id: @maker.id)
  end

  it "displays each car's name" do
    visit '/cars'
    # save_and_open_page
    expect(page).to have_content(@car_1.name)
  end

  it "displays each car's color" do
    visit '/cars'
    expect(page).to have_content(@car_1.color)
    expect(page).to have_content(@car_1.color)
  end

  describe "When I visit the car index" do
    it "shows records where in_production is true" do
      visit '/cars'

      expect(page).to have_content(@car_1.name)
      expect(page).to_not have_content(@car_2.name)
    end
  end
end
