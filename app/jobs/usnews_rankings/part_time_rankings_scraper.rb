#require "nokogiri"
#require "open-uri"
require "csv"

class UsnewsRankings::PartTimeRankingsScraper < ApplicationJob
  queue_as :default

  FIRST_PAGE_URL = "https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings"

  CSV_HEADERS = ["year", "name", "city", "rank", "score", "peer_score", "lsat_25th", "lsat_75th", "acceptance_rate"]

  #class RankingsTable
  #  def initialize(argument)
  #    @argument = argument
  #  end
  #end
#
  #class RankingsRow
  #  #code
  #end

  def perform
    announce("SCRAPING PART-TIME RANKINGS FROM USNEWS.COM")

    CSV.open(csv_file_path, "w", :write_headers=> true, :headers => CSV_HEADERS) do |csv|
      first_page_rankings_table_rows.each do |row|
        #binding.pry
        #puts " +  #{row.text.strip.gsub("\n","")}"
        csv << [rankings_year, "My School", "New York, NY", 1, 100, 4.2, 157, 168, 0.058]
      end
    end
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

  def first_page_rankings_table
    @first_page_rankings_table ||= first_page_source.at_css("table.ranking-data")
  end

  def first_page_rankings_table_body
    first_page_rankings_table.at_css("tbody")
  end

  def first_page_rankings_table_rows
    first_page_rankings_table_body.children.select{|tr| !tr.text.strip.blank? }
  end

  # @param row [Nokogiri::XML::Element]
  def table_row_children(row)
    #code
  end

  #def first_page_rankings
  #  #binding.pry
  #  []
  #end






  def csv_file_path
    Rails.root.join("db/seeds/usnews_rankings/part_time", "#{rankings_year}.csv")
  end

  def csv_file
    @csv_file ||= CSV.read(csv_file_path, headers: true)
  end
end
