#require "nokogiri"
#require "open-uri"
#require "csv"

class UsnewsRankings::PartTimeRankingsScraper < ApplicationJob
  queue_as :default

  FIRST_PAGE_URL = "https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings"

  def perform
    announce("SCRAPING PART-TIME RANKINGS FROM USNEWS.COM")

    FileUtils.mkdir_p(results_csv_path)
  end

  def first_page_source
    @first_page_source ||= Nokogiri::HTML(open(FIRST_PAGE_URL))
  end

  def first_page_title
    @first_page_title ||= first_page_source.title
  end

  def rankings_year
    first_page_title.scan(/\d+/).first.to_i
  end

  def results_csv_path
    Rails.root.join("db/seeds/usnews_rankings/part_time", "#{rankings_year}.csv")
  end
end
