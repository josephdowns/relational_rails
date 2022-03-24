require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:color)}
    it { should validate_presence_of(:doors)}
  end

  describe "relationships" do
    it {should belong_to(:maker)}
  end
end
