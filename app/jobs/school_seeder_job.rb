require "selenium-webdriver"

class MyDriver < Selenium::WebDriver::Firefox::Marionette::Driver
  def quit
    super
  rescue Selenium::WebDriver::Error::UnknownError
    binding.pry
  end
end

class SchoolSeederJob < ApplicationJob
  queue_as :default

  SCHOOLS_PAGE = "https://www.americanbar.org/groups/legal_education/resources/aba_approved_law_schools/official-guide-to-aba-approved-law-schools.html"

  def perform(options = {})
    source = options[:source] || SCHOOLS_PAGE

    driver = MyDriver.new
    driver.get(source)
    puts driver.title
    tables = driver.find_elements(tag_name: "table")
    puts "FOUND #{tables.count} TABLES"


  end

  #def parse_table(html)
  #  #code
  #end
end
