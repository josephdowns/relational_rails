require 'rails_helper'

RSpec.describe "maker update page", type: :feature do
  it "links to /makers/:id/edit" do
    bmw = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)

    visit "/makers/#{bmw.id}"

    click_on "Update #{bmw.name}"
    expect(current_path).to eq("/makers/#{bmw.id}/edit")
  end

  it "updates maker/show page" do
    bmw = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)

    visit "/makers/#{bmw.id}/edit"

    fill_in('maker[name]', with: "BMW")
    fill_in('maker[year_founded]', with: 2016)
    fill_in('maker[domestic]', with: true)
    click_button "Submit"
save_and_open_page
    expect(current_path).to eq("/makers/#{bmw.id}")

    expect(page).to have_content(2016)
    expect(page).to have_content(true)

  end
end
