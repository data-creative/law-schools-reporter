#require "nokogiri"
#require "open-uri"
require "csv"

class UsnewsRankings::PartTimeRankingsScraper < ApplicationJob
  queue_as :default

  FIRST_PAGE_URL = "https://www.usnews.com/best-graduate-schools/top-law-schools/part-time-law-rankings"

  CSV_HEADERS = ["year", "name", "city", "rank", "tie", "score", "peer_score", "lsat_25th", "lsat_75th", "acceptance_rate"]

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
      first_page_rankings_table_rows.each do |element|
        #binding.pry
        #puts " +  #{row.text.strip.gsub("\n","")}"

        name = element.at_css(".school-name").text.strip

        #encoding_options = {
        #  invalid: :replace, # Replace invalid byte sequences
        #  undef: :replace, # Replace anything not defined in ASCII
        #  replace: '', # Use a blank for those replacements
        #  universal_newline: true # Always break lines with \n
        #} # https://stackoverflow.com/a/9420531/670433
        #name = name.encode(Encoding.find('ASCII'), encoding_options)

        # convert weird dash character to normal dash, then remove weird characters like <U+200B>
        name = name.chars.map{|char| char.ord == 8212 ? " - " : char}.select{|char| char.ascii_only? }.join

        ranking = {
          year: rankings_year,
          school_name: name,
          school_city: element.at_css(".location").try(:text).try(:strip), # rutgers doesn't have a location.
          rank: element.at_css(".rankscore-bronze").text.strip.gsub("#","").gsub("Tie",""),
          tie: element.at_css(".rankscore-bronze").text.include?("Tie"),
          score: element.at_css(".c_fin_tot_part_time_display").text.strip.to_i,
          peer_score: element.at_css(".c_pt_avg_acad_rep_score").text.strip.to_f,
          lsat_25th: element.at_css(".pt_lsat_combined").text.strip.split("-").first,
          lsat_75th: element.at_css(".pt_lsat_combined").text.strip.split("-").last,
          acceptance_rate: (element.at_css(".v_pt_acceptance_rate").text.strip.gsub("%","").to_d / 100).to_f # converting to float before dividing produces wrong output
        }

        #pp ranking

        csv << [
          ranking[:year],
          ranking[:school_name],
          ranking[:school_city],
          ranking[:rank],
          ranking[:tie],
          ranking[:score],
          ranking[:peer_score],
          ranking[:lsat_25th],
          ranking[:lsat_75th],
          ranking[:acceptance_rate]
        ]
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
    first_page_rankings_table_body.children.select{ |tr|
      !tr.text.strip.blank? && !tr.text.include?("dblclick('rankingsEmbed')")
    }
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

  #def csv_file
  #  @csv_file ||= CSV.read(csv_file_path, headers: true)
  #end
end
