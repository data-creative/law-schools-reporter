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

      #name = link.content
      #year = link.content

      puts " -- #{url}"
      #school = {url: url, name: name, year: year}
    end
  end

  def document
    @document ||= Nokogiri::HTML(html)
  end

  def tables
    @tables ||= document.css("table")
  end

  def table
    @table ||= tables.find{ |table| table.content.include?("AAKRON") && table.content.include?("YALE") }
  end

  def links
    @links ||= table.css('a') #.select{|link| link.content}
  end

  #def parse_link_text(link)
  #  binding.pry
  #end

  #def parse_table(html)
  #  #code
  #end
end
