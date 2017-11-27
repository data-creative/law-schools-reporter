require 'rails_helper'

RSpec.describe UsnewsRankings::PartTimeRankingsScraper, type: :job do
  let(:job){ described_class.new }

  describe "#perform" do
    let(:mock_first_page_path){ Rails.root.join("spec/mocks/usnews_rankings/part_time/page1.html") }
    let(:mock_first_page_source){ File.open(mock_first_page_path){|f| Nokogiri::HTML(f) } }

    let(:year){ 2017 }
    let(:mock_results_csv_path){ Rails.root.join("spec/mocks/usnews_rankings/part_time", "#{year}.csv") }

    before(:each) do
      FileUtils.rm_f(mock_results_csv_path) # clean-up before later testing existence of this file
      allow(job).to receive(:first_page_source).and_return(mock_first_page_source)
      allow(job).to receive(:results_csv_path).and_return(mock_results_csv_path)
      job.perform
    end

    describe "reading" do
      it "should parse the first page source to find the rankings year" do
        expect(job.rankings_year).to eql(year)
      end

      #it "should paginate through multiple hosted pages" do
      #  expect(pages.count).to eql(2)
      #end
    end

    describe "writing" do
      it "should store results in a single CSV file per year" do
        expect(File.exist?(job.results_csv_path)).to eql(true)
      end
    end
  end

  describe "#rankings_year" do
    let(:mock_first_page_title){ "Best Part-time Law Programs Ranked in 2025 blah blah | US News Rankings blah" }

    before do
      allow(job).to receive(:first_page_title).and_return(mock_first_page_title)
    end

    it "should extract the year from the page title" do
      expect(job.rankings_year).to eql(2025)
    end
  end
end
