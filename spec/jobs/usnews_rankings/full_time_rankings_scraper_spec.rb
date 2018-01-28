require 'rails_helper'

RSpec.describe UsnewsRankings::FullTimeRankingsScraper, type: :job do
  let(:job){ described_class.new }

  describe "#perform" do
    let(:mock_first_page_path){ Rails.root.join("spec/mocks/usnews_rankings/full_time/page1.html") }
    let(:mock_first_page_source){ File.open(mock_first_page_path){|f| Nokogiri::HTML(f) } }

    let(:year){ 2017 }
    let(:mock_csv_file_path){ Rails.root.join("spec/mocks/usnews_rankings/full_time", "#{year}.csv") }

    before(:each) do
      FileUtils.rm_f(mock_csv_file_path) # clean-up before later testing existence of this file
      allow_any_instance_of(described_class::RankingsPage).to receive(:source).and_return(mock_first_page_source)
      allow(job).to receive(:csv_file_path).and_return(mock_csv_file_path)
      job.perform
    end

    describe "writing CSV" do
      it "should store results in a single CSV file per year" do
        expect(File.exist?(mock_csv_file_path)).to eql(true)
      end

      describe "annual results CSV" do
        let(:csv_file){ CSV.read(mock_csv_file_path, headers: true) }

        it "should have a standard header row" do
          expect(csv_file.headers).to match_array(described_class::CSV_HEADERS)
        end

        it "should have a row per school" do
          expect(csv_file.count).to eql(25) # greater than 25 to account for ties, which will all be included
        end

        it "should contain the expected rankings" do
          expect(csv_file.entries.first.to_h).to eql({
            "year"=>"2017",
            "name"=>"Yale University",
            "city"=>"New Haven, CT",
            "tuition_and_fees"=>"$59,865 per year (full-time)",
            "rank"=>"1",
            "tie"=>"false",
            "enrollment_ft"=>"632"
          })
        end
      end
    end
  end
end
