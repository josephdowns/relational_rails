require 'rails_helper'

RSpec.describe Maker, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:year_founded)}
  end

  describe "relationships" do
    it {should have_many(:cars)}
  end
end
