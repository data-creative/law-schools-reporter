require 'rails_helper'

RSpec.describe EmploymentReport, type: :model do
  describe "attributes" do
    it { should serialize(:employment_statuses).as(Hash) }
    it { should serialize(:employment_types).as(Hash) }
    it { should serialize(:employment_locations).as(Array) }
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
  end

  describe "class methods" do
    describe ".with_grads" do
      let(:studentless_report){ create(:employment_report, :without_grads) }
      let(:reports){
        [
          create(:employment_report, :with_grads),
          create(:employment_report, :with_grads),
          studentless_report
        ]
      }

      before(:each) do
        EmploymentReport.delete_all # not sure why this is necessary (maybe database cleaner has a bug?)
        reports
      end

      it "should not include reports which have zero graduates" do
        expect(described_class.with_grads.include?(studentless_report)).to eql(false)
      end
    end
  end
end
