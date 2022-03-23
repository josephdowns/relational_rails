require 'rails_helper'

RSpec.describe Maker, type: :model do
  describe "instance methods" do
    describe "country" do
      it "returns a message when domestic is true" do
        maker = Maker.create!(name: "Dodge", domestic: true, year_founded: 1900)
        expect(maker.country).to eq("Go USA!")
      end

      it "returns a different message when false" do
        maker = Maker.create!(name: "BMW", domestic: false, year_founded: 1916)
        expect(maker.country).to eq("Well...that's cool too.")
      end
    end
  end
end
