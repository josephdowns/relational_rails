require 'rails_helper'

RSpec.describe "delete a car", type: :feature do
  before (:each) do
    @hyundai = Maker.create!(name: "Hyundai", domestic: true, year_founded: 1967)
    @accent = @hyundai.cars.create!(name: "Accent", color: "red", doors: 4, in_production: true)
    @elantra = @hyundai.cars.create!(name: "Elantra", color: "white", doors: 4, in_production: true)
    @genesis = @hyundai.cars.create!(name: "Genesis", color: "purple", doors: 4, in_production: false)
  end

  describe "visit the maker/car index page" do
    it "click a link to delete car" do
      visit "/makers/#{@hyundai.id}/cars"
      expect(page).to have_content(@accent.name)
      expect(page).to have_content(@elantra.name)
      expect(page).to have_content(@genesis.name)

      click_on "Delete #{@elantra.name}"

      expect(current_path).to eq("/cars")
      expect(page).to have_content("#{@accent.name}")
      expect(page).to_not have_content("#{@elantra.name}")
    end
  end
end
