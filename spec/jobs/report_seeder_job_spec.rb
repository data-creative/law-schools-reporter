require 'rails_helper'

RSpec.describe ReportSeederJob, type: :job do
  let(:years){ (2011..2017).to_a } # increment me as the years progress

  before(:all) do
    described_class.new.perform
  end

  it "should populate the employment_reports table" do
    expect(EmploymentReport.count).to eql(1450) # increment me as the years progress
  end

  it "should include reports for all available years" do
    expect(EmploymentReport.pluck(:year).uniq).to match_array(years)
  end

  it "should include reports from all available schools" do
    expect(EmploymentReport.pluck(:school_name).uniq.include?("AKRON, UNIVERSITY OF")).to eql(true)
  end
end
