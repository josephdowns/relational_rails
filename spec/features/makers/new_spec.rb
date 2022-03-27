require 'rails_helper'

RSpec.describe "maker creation page", type: :feature do


  it "links me to a makers/new" do
    visit "/makers"
    click_on "New Maker"

    expect(current_path).to eq("/makers/new")
  end

  it "should create a new maker" do
    visit '/makers/new'
# save_and_open_page
    fill_in('maker[name]', with: "Testla")
    fill_in('maker[year_founded]', with: 2003)
    fill_in('maker[domestic]', with: true)
    click_button "Create Maker"

    expect(current_path).to eq("/makers")
    expect(page).to have_content("Testla")

  end
end
