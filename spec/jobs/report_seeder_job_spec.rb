require 'rails_helper'

RSpec.describe ReportSeederJob, type: :job do
  let(:years){ (2012..2017).to_a }
  let(:batches){
    {
      "2011" => 200, "2012" => 197, "2013" => 216, "2014" => 203, "2015" => 203,
      "2016" => 208, "2017" => 223
    }
  }
  let(:batch_sizes){ years.map{|year| batches[year.to_s] } }

  before(:all) do
    described_class.new.perform(years: (2012..2017).to_a)
  end

  after(:all) do
    EmploymentReport.delete_all # because the process will create actual records in the test db which, I guess unlike factories, will not otherwise be deleted at the end of each test.
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

    it "should persist employment statuses" do
      expect(report.employment_statuses).to eql({})
    end

    it "should persist employment types" do
      expected_types = {
        :law_firms=>{
          :solo=>5,
          :step_10=>33,
          :step_25=>6,
          :step_50=>3,
          :step_100=>3,
          :step_250=>9,
          :step_500=>2,
          :over_500=>1,
          :unknown_size=>1
        },
        :business=>32,
        :government=>23,
        :public_interest=>2,
        :clerkships=>{:federal=>1, :state_local=>1, :other=>1},
        :academia=>1,
        :unknown_type=>0
      }
      expect(report.employment_types).to eql(expected_types)
    end

    it "should persist employment locations" do
      expected_locations = [
        {"label"=>"State of Largest Employment", "location"=>"Ohio", "count"=>105},
        {"label"=>"State of 2nd Largest Employment", "location"=>"Pennsylvania", "count"=>6},
        {"label"=>"State of 3rd Largest Employment", "location"=>"California", "count"=>2},
        {"label"=>"Employed in Foreign Countries", "location"=>"Foreign Countries", "count"=>0}
      ]
      expect(report.employment_locations).to eql(expected_locations)
    end
  end
end
