#require "nokogiri"
#require "open-uri"
require "csv"

class UsnewsRankings::FullTimeRankingsScraper < ApplicationJob
  queue_as :default

  CSV_HEADERS = ["year", "name", "city", "rank", "tie", "tuition_and_fees", "enrollment_ft"]

  def perform
    announce("SCRAPING FULL-TIME RANKINGS FROM USNEWS.COM")

    page = RankingsPage.new
    rankings_year = page.year

    CSV.open(csv_file_path(rankings_year), "w", :write_headers=> true, :headers => CSV_HEADERS) do |csv|
      page.table_rows.each do |element|
        ranking = AnnualRanking.new(rankings_year, element)
        csv << ranking.csv_row
      end
    end
  end

  def csv_file_path(year)
    Rails.root.join("db/seeds/usnews_rankings/full_time", "#{year}.csv")
  end

  #def csv_file(year)
  #  @csv_file ||= CSV.read(csv_file_path(year), headers: true)
  #end

  class RankingsPage
    attr_reader :page_number

    FIRST_PAGE_URL = "https://www.usnews.com/best-graduate-schools/top-law-schools/law-rankings"

    # @param [Integer] page_number
    def initialize(page_number = 1)
      @page_number = page_number
    end

    def url
      page_number == 1 ? FIRST_PAGE_URL : "#{FIRST_PAGE_URL}/page+#{page_number}"
    end

    def source
      @source ||= Nokogiri::HTML(open(url))
    end

    def title
      @title ||= source.title
    end

    # should extract the year from the page title
    def year
      @year ||= title.scan(/\d+/).first.to_i
    end

    def table
      @table ||= source.at_css("table.ranking-data")
    end

    def table_body
      @table_body ||= table.at_css("tbody")
    end

    def table_rows
      @table_rows ||= table_body.children.select{ |tr|
        !tr.text.strip.blank? && !tr.text.include?("dblclick('rankingsEmbed')")
      }
    end
  end

  class AnnualRanking
    attr_reader :year, :element

    # @param [Integer] year
    # @param [Nokogiri::XML::Element] a rankings table row ("tr") element
    def initialize(year, element)
      @year = year
      @element = element
    end

    # converts weird dash character (#8212) to normal dash, then removes weird characters like <U+200B>
    def school_name
      name = element.at_css(".school-name").text.strip
      name = name.chars.map{|char| char.ord == 8212 ? " - " : char}.select{|char| char.ascii_only? }.join
    end

    def school_city
      element.at_css(".location").try(:text).try(:strip) # rutgers doesn't have a location
    end

    def rank
      element.at_css(".rankscore-bronze").text.strip.gsub("#","").gsub("Tie","")
    end

    def tie
      element.at_css(".rankscore-bronze").text.include?("Tie")
    end

    def tuition_and_fees
      element.at_css(".search_tuition").text.strip # todo: also include text within span.rankings-costInfo
    end

    def full_time_enrollment
      element.at_css(".v_ft_enrolled").text.strip
    end

    def csv_row
      [year, school_name, school_city, rank, tie, tuition_and_fees, full_time_enrollment]
    end
  end
end
