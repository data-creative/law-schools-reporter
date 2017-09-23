require 'rails_helper'

RSpec.describe School, type: :model do
  describe "attributes" do
    it { should serialize(:alt_names).as(Array) }
  end

  #describe "associations" do
  #  it { should have_many(:employment_reports) }
  #end

  describe "validations" do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }

    it { should validate_numericality_of(:year).only_integer }

    context "uniqueness" do
      subject { build(:school) }
      it { should validate_uniqueness_of(:url) }
    end
  end
end
