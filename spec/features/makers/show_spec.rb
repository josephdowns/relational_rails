require 'rails_helper'

RSpec.describe 'the makers show page' do
  it "displays the makers name" do
    maker_1 = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)

    visit "/makers/#{maker_1.id}"
    expect(page).to have_content(maker_1.name)
  end

  it "displays the makers year_founded"
end
