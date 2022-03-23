require 'rails_helper'

RSpec.describe "maker index page", type: :feature do
  it "can list makers' name" do
    maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    maker_2 = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)

    visit "/makers"
    expect(page).to have_content(maker_1.name)
    expect(page).to have_content(maker_2.name)

  end
end
