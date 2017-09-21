require 'rails_helper'

RSpec.describe SchoolSeederJob, type: :job do
  before(:all) do
    html_file = Rails.root.join("spec/mocks/aba-schools-page.html")
    mock_source = "file:#{html_file.to_s}"
    #described_class.new.perform(source: mock_source)
    described_class.new.perform
  end

  #after(:all) do
  #  School.delete_all # because the process will create actual records in the test db which, I guess unlike factories, will not otherwise be deleted at the end of each test.
  #end

  let(:school_links){ [{href: "https://my-school.edu", val: "MY SCHOOL 1"}]}

  it "should populate the schools table" do
    expect(false).to eql(true)
    #expect(School.count).to eql(school_links.count)
  end
end
