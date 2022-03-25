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

  it "sorts using order_by_created_at" do
    maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    maker_2 = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)
    maker_3 = Maker.create!(name: "Ford", domestic: true, year_founded: 1896)

    visit "/makers"

    expect(maker_3.name).to appear_before(maker_2.name)
    expect(maker_2.name).to appear_before(maker_1.name)

  end
end