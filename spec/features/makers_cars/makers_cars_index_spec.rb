# User Story 5, Parent Children Index
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'

RSpec.describe "associations", type: :feature do
  before (:each) do
    @dodge = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    @bmw = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)

    @x5 = @bmw.cars.create!(name: "X5", color: "blue", doors: 4, in_production: true)
    @ix = @bmw.cars.create!(name: "iX", color: "black", doors: 4, in_production: true)

    @neon = @dodge.cars.create!(name: "Neon", color: "white", doors: 4, in_production: true)
    @aries = @dodge.cars.create!(name: "Aries", color: "beige", doors: 2, in_production: false)

  end

  it "display each car associated with maker" do
    visit "/makers/#{@dodge.id}/cars"

    expect(page).to have_content(@neon.name)
    expect(page).to have_content(@aries.name)
    expect(page).to have_content(@neon.color)
    expect(page).to have_content(@aries.color)
    expect(page).to have_content(@neon.in_production)
    expect(page).to have_content(@aries.in_production)
    
    expect(page).to_not have_content(@x5.name)
    expect(page).to_not have_content(@ix.name)
  end
end
