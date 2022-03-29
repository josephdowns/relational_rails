# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe "destroy a maker" do
  before (:each) do
    @maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)

    @durango = @maker_1.cars.create!(name: "Durango", color: "black", doors: 4, in_production: true)
    @neon = @maker_1.cars.create!(name: "Neon", color: "white", doors: 4, in_production: true)
    @aries = @maker_1.cars.create!(name: "Aries", color: "beige", doors: 2, in_production: false)
  end
  describe "when I visit the maker show page" do
    it "deletes a maker from the show page" do
     visit "/makers/#{@maker_1.id}"
     click_on "Delete #{@maker_1.name}"
     expect(current_path).to eq("/makers")
     expect(page).to_not have_content("#{@maker_1.name}")
    end
  end
end
