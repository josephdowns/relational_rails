# User Story 3, Child Index
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

require 'rails_helper'

RSpec.describe "car index page", type: :feature do
  before (:each) do
    @maker = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    @car_1 = Car.create!(name: "", color: "", doors: 4, in_production: true, maker_id: @maker.id)
    @car_2 = Car.create!(name: "", color: "", doors: 4, in_production: true, maker_id: @maker.id)
  end

  it "displays each car name and makers name" do
    vist '/cars'
    expect(page).to have_content(@maker.name)
    expect(page).to have_content(@car_1.name)
    expect(page).to have_content(@car_2.name)
  end
end
