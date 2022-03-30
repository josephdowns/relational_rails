require 'rails_helper'

RSpec.describe "pathway to add a car", type: :feature do
  before (:each) do
    @ford = Maker.create!(name: "Ford", domestic: true, year_founded: 1896)
    @taurus = @ford.cars.create!(name: "Taurus", color: "white", doors: 4, in_production: true)
    @ranger = @ford.cars.create!(name: "Ranger", color: "orange", doors: 2, in_production: true)
    @aerostar = @ford.cars.create!(name: "Aerostar", color: "white", doors: 3, in_production: false)
  end
  it "links to /makers/:maker_id/cars/new" do
    visit "/makers/#{@ford.id}/cars"

    click_on "Add New Car"

    expect(current_path).to eq("/makers/#{@ford.id}/cars/new")
  end

  it "adds a new car to show page" do
    visit "/makers/#{@ford.id}/cars/new"

    fill_in('name', with: "Zeus")
    fill_in('color', with: "purple")
    fill_in('doors', with: "5")
    fill_in('in_production', with: "false")
    click_button "Create Car"

    expect(current_path).to eq("/makers/#{@ford.id}/cars")
    expect(page).to have_content("Zeus")
    expect(page).to have_content("purple")
    expect(page).to have_content("5")

  end
end
