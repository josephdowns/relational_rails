require 'rails_helper'

RSpec.describe "maker creation page", type: :feature do


  it "links me to a makers/new" do
    visit "/makers"
    click_on "New Maker"

    expect(current_path).to eq("/makers/new")
  end

  it "should create a new maker" do
    visit '/makers/new'

    fill_in("name", with: "Testla")
    fill_in("year_founded", with: 2003)
    fill_in("domestic", with: true)
    click_button "Create Maker"

    expect(current_path).to eq("/makers")
    expect(page).to have_content("Testla")
    expect(page).to_not have_content("Taurus")
  end
end
