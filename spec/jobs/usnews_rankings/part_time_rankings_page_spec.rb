require 'rails_helper'

RSpec.describe UsnewsRankings::PartTimeRankingsScraper::RankingsPage do
  let(:page){ described_class.new }

  describe "#year" do
    let(:mock_first_page_title){ "Best Part-time Law Programs Ranked in 2025 blah blah | US News Rankings blah" }

    before do
      allow(page).to receive(:title).and_return(mock_first_page_title)
    end

    it "should extract the year from the page title" do
      expect(page.year).to eql(2025)
    end
  end
end
