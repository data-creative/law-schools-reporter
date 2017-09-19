require 'rails_helper'

RSpec.describe ReportSeederJob, type: :job do
  #let(:years){ (2012..2017).to_a }
  #let(:schools){ School.all }
  let(:school_names){ EmploymentReport.pluck(:school_name) }

  before(:each) do
    described_class.new.perform
  end

  #it "should use information from the ABA website" do
  #
  #end

  #it "should populate the employment_reports table" do
  #  expect(EmploymentReport.count).to eql(1500)
  #end

  #it "should include reports for all available years" do
  #  expect(reporting_years).to match_array(years)
  #end

  it "should include reports from all available schools" do
    expect(school_names.include?("AKRON, UNIVERSITY OF")).to eql(true)
  end
end
