# User Story 3, Child Index
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

require 'rails_helper'

RSpec.describe "car index page", type: :feature do
  before (:each) do
    @maker = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    @car_1 = Car.create!(name: "Durango", color: "black", doors: 4, in_production: true, maker_id: @maker.id)
    @car_2 = Car.create!(name: "Aries", color: "beige", doors: 2, in_production: false, maker_id: @maker.id)
  end

  it "displays each car's name" do
    visit '/cars'
    save_and_open_page
    expect(page).to have_content(@car_1.name)
    expect(page).to have_content(@car_2.name)
  end

  it "displays each car's color" do
    visit '/cars'
    expect(page).to have_content(@car_1.color)
    expect(page).to have_content(@car_1.color)    
  end
end
