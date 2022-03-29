require 'rails_helper'

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

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
    # save_and_open_page

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
