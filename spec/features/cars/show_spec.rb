# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

require 'rails_helper'

RSpec.describe "displays a certain car and attributes", type: :feature do
  before (:each) do
    @maker = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    @car_1 = Car.create!(name: "Durango", color: "black", doors: 4, in_production: true, maker_id: @maker.id)
    @car_2 = Car.create!(name: "Aries", color: "beige", doors: 2, in_production: false, maker_id: @maker.id)
  end

  it "displays Durango and its attributes" do
    visit "/cars/#{@car_1.id}"

    expect(page).to have_content(@car_1.name)
    expect(page).to have_content(@car_1.color)
    expect(page).to_not have_content(@car_2.name)
  end

  it "can display something different" do
    visit "/cars/#{@car_2.id}"
    
    expect(page).to have_content(@car_2.name)
    expect(page).to have_content(@car_2.color)
    expect(page).to_not have_content(@car_1.name)
  end
end
