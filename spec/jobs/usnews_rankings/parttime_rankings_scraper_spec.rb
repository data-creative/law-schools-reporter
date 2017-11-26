require 'rails_helper'

RSpec.describe UsnewsRankings::ParttimeRankingsScraper, type: :job do
  describe "perform" do
    let(:job){ described_class.new }

    let(:mock_first_page_path){ Rails.root.join("spec/mocks/usnews_rankings/part_time/page1.html") }
    let(:mock_first_page_source){ File.open(mock_first_page_path){|f| Nokogiri::HTML(f) } }

    let(:year){ 2017 }
    let(:csv_file){ Rails.root.join("db/seeds/usnews_rankings/parttime", "#{year}.csv") }

    before(:each) do
      allow(job).to receive(:first_page_source).and_return(mock_first_page_source)
      job.perform
    end

    describe "reading" do
      it "should parse the first page source to find the ranking year" do
        binding.pry
        #expect(job.ranking_year).to eql(year)
      end

      #it "should paginate through multiple hosted pages" do
      #  expect(pages.count).to eql(2)
      #end
    end

    #describe "writing" do
    #  it "should store results in a single CSV file" do
    #    expect(File.exist?(csv_file)).to eql(true)
    #  end
    #end
  end
end
