# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

require 'rails_helper'

RSpec.describe "delete a car", type: :feature do
  before (:each) do
    @hyundai = Maker.create!(name: "Hyundai", domestic: true, year_founded: 1967)
    @accent = hyundai.cars.create!(name: "Accent", color: "red", doors: 4, in_production: true)
    @elantra = hyundai.cars.create!(name: "Elantra", color: "white", doors: 4, in_production: true)
    @genesis = hyundai.cars.create!(name: "Genesis", color: "purple", doors: 4, in_production: false)
  end
  describe "visit a car show page" do
    it "click a link to delete car" do
      visit "/cars/#{@elantra.id}"
      click_on "Delete #{@elantra.name}"
      expect(current_path).to eq("/cars")
      expect(page).to_not have_content("#{@elantra.name}")
    end
  end
end
