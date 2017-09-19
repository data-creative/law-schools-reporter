require 'rails_helper'

RSpec.describe EmploymentReport, type: :model do
  describe "attributes" do
    it { should serialize(:employment_statuses).as(Hash) }
    it { should serialize(:employment_types).as(Hash) }
    it { should serialize(:employment_locations).as(Hash) }
  end

  #describe "associations" do
  #  it { should belong_to(:school) }
  #end

  describe "validations" do
    #it { should validate_presence_of(:school) }
    it { should validate_presence_of(:school_name) }
    it { should validate_presence_of(:year) }

    it { should validate_numericality_of(:year).only_integer }

    context "uniqueness" do
      subject { build(:employment_report) }
      it { should validate_uniqueness_of(:school_name).scoped_to(:year) }
    end

    context "counts" do
      
    end
  end
end
