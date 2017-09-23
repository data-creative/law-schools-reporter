require 'rails_helper'

RSpec.describe School, type: :model do
  #describe "associations" do
  #  it { should have_many(:employment_reports) }
  #end

  describe "validations" do
    it { should validate_presence_of(:uuid) }
    it { should validate_presence_of(:long_name) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }

    it { should validate_numericality_of(:uuid).only_integer }
    it { should validate_numericality_of(:year_founded).only_integer }

    context "uniqueness" do
      subject { build(:school) }
      it { should validate_uniqueness_of(:uuid) }
      it { should validate_uniqueness_of(:long_name) }
      it { should validate_uniqueness_of(:name) }
      it { should validate_uniqueness_of(:url) }
    end
  end
end
