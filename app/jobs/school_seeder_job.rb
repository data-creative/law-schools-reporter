require "selenium-webdriver"

# # adapted from source: https://github.com/teamcapybara/capybara/issues/1773#issuecomment-253401557
# Module SeleniumPatch
#   def quit
#     super
#     rescue Selenium::WebDriver::Error::UnknownError
#   end
# end
#
# Capybara::Selenium::Driver.prepend SeleniumPatch

class SchoolSeederJob < ApplicationJob
  queue_as :default

  SCHOOLS_PAGE = "https://www.americanbar.org/groups/legal_education/resources/aba_approved_law_schools/official-guide-to-aba-approved-law-schools.html"

  def perform(options = {})
    source = options[:source] || SCHOOLS_PAGE

    driver = Selenium::WebDriver.for(:firefox)
    driver.get(source)
    puts driver.title

    tables = driver.find_elements(tag_name: "table")
    puts "FOUND #{tables.count} TABLES"

    begin
      driver.quit
    rescue Selenium::WebDriver::Error::UnknownError => e
      if e.message.include?("quit")
        binding.pry

        begin
          driver.quit
        rescue Errno::ECONNREFUSED => e
          puts "123"
          binding.pry
        end
      end
    rescue Errno::ECONNREFUSED => e
      puts "456"
      binding.pry
    end
  end

  #def parse_table(html)
  #  #code
  #end
end
