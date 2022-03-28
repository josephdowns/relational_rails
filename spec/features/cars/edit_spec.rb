# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe "update a car", type: :feature do
  describe "As a visitor when I click a link " do
    it "takes me to cars/:id/edit" do
      hyundai = Maker.create!(name: "Hyundai", domestic: true, year_founded: 1967)
      accent = hyundai.cars.create!(name: "Accent", color: "red", doors: 4, in_production: true)

      visit "/cars/#{accent.id}"
      click_on "Update #{accent.name}"
      
      expect(current_path).to eq("/cars/#{accent.id}/edit")

    end
  end

  describe "When I click the submit button" do
    it "sends a patch request to cars/id and updates display" do
      hyundai = Maker.create!(name: "Hyundai", domestic: true, year_founded: 1967)
      accent = hyundai.cars.create!(name: "Accent", color: "red", doors: 4, in_production: true)

      visit "/cars/#{accent.id}/edit"

      fill_in('name', with: "Talkie")
      fill_in('doors', with: 3)
      click_button "Submit"

      expect(current_path).to eq("/cars/#{accent.id}")
      expect(page).to have_content("Talkie")
      expect(page).to_not have_content("Accent")

    end
  end
end
