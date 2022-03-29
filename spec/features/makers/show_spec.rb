require 'rails_helper'

RSpec.describe 'the makers show page' do
  before (:each) do
    @maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)

    @durango = @maker_1.cars.create!(name: "Durango", color: "black", doors: 4, in_production: true)
    @neon = @maker_1.cars.create!(name: "Neon", color: "white", doors: 4, in_production: true)
    @aries = @maker_1.cars.create!(name: "Aries", color: "beige", doors: 2, in_production: false)
  end

  it "displays the makers name" do
    visit "/makers/#{@maker_1.id}"
    expect(page).to have_content(@maker_1.name)
  end

  it "displays the makers year_founded" do
    visit "/makers/#{@maker_1.id}"
    expect(page).to have_content(@maker_1.year_founded)
  end

  it "displays domestic or not" do
    visit "/makers/#{@maker_1.id}"
    expect(page).to have_content(@maker_1.domestic)
  end

  it "displays a count of cars associated with the maker" do

    visit "/makers/#{@maker_1.id}"
    expect(page).to have_content("#{@maker_1.cars_count}")
  end

  it "links to makers index page" do
    visit "/makers/#{@maker_1.id}"

    click_on "All Makers"

    expect(current_path).to eq("/makers")
  end

  it "links to makers/:id/show page" do
    visit "/makers/#{@maker_1.id}"

    click_on "List of #{@maker_1.name} Cars"

    expect(current_path).to eq("/makers/#{@maker_1.id}/cars")
  end

end
