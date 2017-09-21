# Credits, Notes, and Reference

  + [School Parsing (PY)](https://github.com/data-creative/law-schools-py/)
  + [Reports Archive](https://github.com/s2t2/aba-employment-summary-reports-archive/)
  + [Working around Selenium driver's broken `.close` method](https://github.com/teamcapybara/capybara/issues/1773)

## Creating Mock Page Source

Downloading the HTML source of the Schools Page doesn't trigger a document ready event which triggers the page content to be written. So use this code to download the post-page-load source:

```rb
puts "CACHING PAGE SOURCE FOR FUTURE TESTS"

SCHOOLS_PAGE = "https://www.americanbar.org/groups/legal_education/resources/aba_approved_law_schools/official-guide-to-aba-approved-law-schools.html"

MOCK_FILE = Rails.root.join("spec/mocks/aba-schools-page.html").to_s

driver = Selenium::WebDriver.for(:firefox)
driver.get(SCHOOLS_PAGE)
puts driver.title

File.open(MOCK_FILE, "wb") do |local_file|
  local_file.write(driver.page_source)
end
```
