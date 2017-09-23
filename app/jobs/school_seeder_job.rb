require "nokogiri"

class SchoolSeederJob < ApplicationJob
  queue_as :default

  attr_reader :html

  def initialize(options = {})
    @html = options[:html]
  end

  def perform(options = {})
    links.each do |link|
      url = link.attributes["href"].value
      name, year = self.class.parse_link_content(link.content)

      school = School.where(url: url).first_or_initialize
      school.update_attributes!(name: name, year: year)
    end
  end

  def document
    @document ||= Nokogiri::HTML(html)
  end

  def tables
    @tables ||= document.css("table")
  end

  def schools_table
    @table ||= tables.find{ |table| table.content.include?("AAKRON") && table.content.include?("YALE") }
  end

  def links
    @links ||= schools_table.css('a').select{|link| !link.content.blank? }
  end

  # @param [String] text like "AKRON (1961)" and various edge-cases (see specs)
  def self.parse_link_content(content)
    #puts content
    name = content[0, content.index(content.split("(").last) -1 ].strip.upcase # use everything before the last paren begins
    year = content.split("(").last.remove(")").remove("*").strip.last(4).to_i
    return name, year
  end
end
