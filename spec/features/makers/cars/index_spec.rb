require 'rails_helper'

RSpec.describe "associations", type: :feature do
  before (:each) do
    @dodge = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
    @bmw = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)

    @x5 = @bmw.cars.create!(name: "X5", color: "blue", doors: 4, in_production: true)
    @ix = @bmw.cars.create!(name: "iX", color: "black", doors: 4, in_production: true)
    @z1 = @bmw.cars.create!(name: "Z1", color: "red", doors: 2, in_production: false)

    @neon = @dodge.cars.create!(name: "Neon", color: "white", doors: 4, in_production: true)
    @aries = @dodge.cars.create!(name: "Aries", color: "beige", doors: 2, in_production: false)

  end

  it "display each car associated with maker" do
    visit "/makers/#{@dodge.id}/cars"

    expect(page).to have_content(@dodge.name)

    expect(page).to have_content(@neon.name)
    expect(page).to have_content(@aries.name)

    expect(page).to_not have_content(@x5.name)
    expect(page).to_not have_content(@ix.name)
  end

  it "links to each cars show page" do
    visit "/makers/#{@dodge.id}/cars"

    click_on @neon.name

    expect(current_path).to eq("/cars/#{@neon.id}")
  end

  describe "When I visit the maker/cars/ index page" do
    it "has a link to sort children in alphabetical order" do
      visit "/makers/#{@dodge.id}/cars"

      expect(@neon.name).to appear_before(@aries.name)

      click_on "Sort Cars A-Z"

      expect(@aries.name).to appear_before(@neon.name)
    end
    #   As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.

    describe "has a form to input a number" do
      it "only displays values that exceed that number" do
        visit "/makers/#{@bmw.id}/cars"
        expect(page).to have_content("#{@x5.name}")
        expect(page).to have_content("#{@ix.name}")
        expect(page).to have_content("#{@z1.name}")

        fill_in("Only show cars with more doors than", with: 3)
        click_on "Submit"

        expect(page).to have_content("#{@x5.name}")
        expect(page).to have_content("#{@ix.name}")
        expect(page).to_not have_content("#{@z1.name}")

      end
    end
  end


end
