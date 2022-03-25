require 'rails_helper'

RSpec.describe "maker index page", type: :feature do
  it "can list makers' name" do
    maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    maker_2 = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)

    visit "/makers"
    expect(page).to have_content(maker_1.name)
    expect(page).to have_content(maker_2.name)
  end

  #   As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it "displays timestamp of created by" do
    maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    maker_2 = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)

    visit "/makers"

    expect(page).to have_content(maker_1.created_at)
    expect(page).to have_content(maker_2.created_at)
  end

  # it "orders the makers by created_at" do
  #   maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
  #   maker_2 = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)
  #
  #   visit "/makers"
  #   all_makers = page.all('.maker')
  #
  #   expect(page.all('.maker')[0]).to have_content("Dodge")
  #   expect(page.all('.maker')[1]).to have_content("BMW")
  #
  # end
end
