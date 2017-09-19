require 'rails_helper'

RSpec.describe ReportSeederJob, type: :job do

  before(:all) do
    described_class.new.perform
  end

  #it "should populate the employment_reports table" do
  #  expect(EmploymentReport.count).to eql(1500)
  #end

  it "should include reports for all available years" do
    expect(EmploymentReport.pluck(:year)).to match_array([2017])
  end

  it "should include reports from all available schools" do
    expect(EmploymentReport.pluck(:school_name).include?("AKRON, UNIVERSITY OF")).to eql(true)
  end
end
