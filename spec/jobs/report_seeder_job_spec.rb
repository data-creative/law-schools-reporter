require 'rails_helper'

RSpec.describe ReportSeederJob, type: :job do
  #let(:years){ (2011..2017).to_a }
  let(:years){ (2012..2017).to_a }
  #let(:years){ [2016, 2017] }
  let(:batches){
    {
      "2011" => 200,
      "2012" => 197,
      "2013" => 216,
      "2014" => 203,
      "2015" => 203,
      "2016" => 208,
      "2017" => 223
    }
  }
  let(:batch_sizes){ years.map{|year| batches[year.to_s] } }

  before(:all) do
    EmploymentReport.delete_all # not sure why this is necessary
    #described_class.new.perform(years: (2011..2017).to_a)
    described_class.new.perform(years: (2012..2017).to_a)
    #described_class.new.perform(years: [2016, 2017])
  end

  it "should populate the employment_reports table" do
    expect(EmploymentReport.count).to eql(batch_sizes.sum)
  end

  it "should include reports for all available years" do
    expect(EmploymentReport.pluck(:year).uniq).to match_array(years)
  end

  it "should include reports from all available schools" do
    expect(EmploymentReport.pluck(:school_name).uniq.count).to be >= batch_sizes.max
  end

  describe "report" do
    let(:report){ EmploymentReport.where(year: 2016, school_name: "AKRON, UNIVERSITY OF").first }

    it "should persist class size" do
      expect(report.total_grads.to_i).to eql(142)
    end

    it "should persist employment counts" do
      expect(report.total_employed.to_i).to eql(124)
    end

    it "should persist employment types" do
      expect(report.employment_types).to eql({})
    end

    it "should persist employment statuses" do
      expect(report.employment_statuses[:law_firms][:step_25].to_i).to eql(6)
    end

    it "should persist employment locations" do
      expect(report.employment_locations).to eql({})
    end
  end
end
