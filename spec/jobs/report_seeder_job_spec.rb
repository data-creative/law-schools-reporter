require 'rails_helper'

RSpec.describe ReportSeederJob, type: :job do
  describe "perform" do
    let(:mock_batches){ {"2012" => 18, "2016" => 20, "2017" => 41} }
    let(:batch_sizes){ mock_batches.map{|_,v| v} }
    let(:years) { mock_batches.map{|k,_| k.to_i} }

    before(:all) do
      RSpec::Mocks.with_temporary_scope do # use this technique to allow stubbing within a before(:all) hook
        create(:school, long_name: "AKRON, UNIVERSITY OF") # to be matched with report via long_name
        create(:school, name: "BOSTON COLLEGE") # to be matched with report via name
        create(:school, uuid: 168, name: "CARDOZO") # to be matched with report via lookup

        job = described_class.new
        allow(job).to receive(:csv_dir).and_return(Rails.root.join("spec/mocks/batch_employment_reports")) # use smaller files to reduce test time
        job.perform(years: [2012, 2016, 2017])
      end
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

    describe "seeded reports" do
      let(:report){ EmploymentReport.where(year: 2016, school_name: "AKRON, UNIVERSITY OF").first }
      let(:report_matchable_on_name){ EmploymentReport.where(year: 2017, school_name: "BOSTON COLLEGE").first }
      let(:report_matchable_on_lookup){ EmploymentReport.where(year: 2012, school_name: "YESHIVA UNIVERSITY").first }

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
          :law_firms=>{ :solo=>5, :step_10=>33, :step_25=>6, :step_50=>3, :step_100=>3, :step_250=>9, :step_500=>2, :over_500=>1, :unknown_size=>1},
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

      it "should identify a matching school on the basis of a shared long_name" do
        expect(report.school_uuid.blank?).to eql(false)
      end

      it "should identify a matching school on the basis of a shared name" do
        expect(report_matchable_on_name.school_uuid.blank?).to eql(false)
      end

      it "should identify a matching school on the basis of a uuid lookup" do
        expect(report_matchable_on_lookup.school_uuid.blank?).to eql(false)
      end
    end
  end
end
