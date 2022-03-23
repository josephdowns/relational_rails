require 'rails_helper'

RSpec.describe 'the makers show page' do
  before (:each) do
    @maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
  end

  it "displays the makers name" do
    visit "/makers/#{@maker_1.id}"
    expect(page).to have_content(@maker_1.name)
  end

  it "displays the makers year_founded" do
    visit "/makers/#{@maker_1.id}"
    # save_and_open_page
    expect(page).to have_content(@maker_1.year_founded)
  end

  it "displays domestic or not" do
    visit "/makers/#{@maker_1.id}"
    expect(page).to have_content(@maker_1.domestic)
  end
end
