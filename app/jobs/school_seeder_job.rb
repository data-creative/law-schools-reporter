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
      name, year = parse_link_content(link.content)

      school = School.where(url: url).first_or_create
      school.update_attributes(name: name, year: year)
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
    @links ||= table.css('a') # .map{ |link| Link.new(link) } #.select{|link| link.content}
  end

  # @param [String] text like ...
  # ... "AKRON (1961)"
  # ... "LA VERNE (2006-2011; 2012)"
  # ... "ST. THOMAS (Florida) (1988)"
  def self.parse_link_content(content)
    puts content
    #binding.pry if content.include?("CONCORDIA (2015)*")
    name = content[0, content.index(content.split("(").last) -1 ].strip.upcase # use everything before the last paren begins
    year = content.split("(").last.remove(")").remove("*").strip.last(4).to_i
    return name, year
  end


  #def self.index_of_last_open_paren(text):
  #  return [m.start() for m in re.finditer("\(", text)][-1] # adapted from source: https://stackoverflow.com/questions/4664850/find-all-occurrences-of-a-substring-in-python
  #end
  #
  #def self.index_of_last_close_paren(text):
  #  return [m.start() for m in re.finditer("\)", text)][-1] # todo: refactor
  #end
=begin
  def parse_link_text(text):
      o = index_of_last_open_paren(text)
      c = index_of_last_close_paren(text)

      name = text[0 : o] # use everything before the last paren begins
      name = name.strip().upper()

      year = text[o+1:c] # use everything between the last parens
      try:
          year = int(year)
      except ValueError as e: # handle when there is other text in the year (a hyphen) todo: refactor
          i = year.index("-")
          year = year[i+1 :].strip() # use everything after the last hyphen, inclusive
          try:
              year = int(year)
          except ValueError as e: # handle when there is other text in the year (a semi-colon) todo: refactor
              s = year.index(";")
              year = year[s+1 :].strip()
              year = int(year)

      return name, year
=end








  #def parse_table
  #  #code
  #end

  #class Link
  #  include HasUrl
#
  #  attr_reader :link
#
  #  def initialize(options = {})
  #    @url = url
  #  end
#
  #  def method
  #    #code
  #  end
  #end
end
