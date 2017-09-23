require 'rails_helper'

RSpec.describe SchoolSeederJob, type: :job do
  describe "perform" do
    before(:all) do
      schools_page = Rails.root.join("db/seeds/schools-page.html")
      html = File.read(schools_page)
      described_class.new(html: html).perform
    end

    #after(:all) do
    #  School.delete_all # because the process will create actual records in the test db which, I guess unlike factories, will not otherwise be deleted at the end of each test.
    #end

    #let(:school_links){ [{href: "https://my-school.edu", val: "MY SCHOOL 1"}]}

    it "should populate the schools table" do
      expect(School.count).to eql(school_links.count)
    end
  end

  describe ".parse_link_content" do
    let(:links){
      [
         {content: "AKRON (1961)", name: "AKRON", year:1961},
         {content: "ARIZONA SUMMIT(formerly Phoenix - 2007)", name: "ARIZONA SUMMIT", year:2007},
         {content: "CALIFORNIA - Berkeley (1923)", name: "CALIFORNIA - BERKELEY", year:1923},
         {content: "CONCORDIA (2015)*", name: "CONCORDIA", year:2015},
         {content: "LA VERNE (2006-2011; 2012)", name: "LA VERNE", year:2012},
         {content: "MITCHELL|HAMLINE (2015)", name: "MITCHELL|HAMLINE", year:2015}, # consider 'MITCHELL - HAMLINE'
         {content: "NEVADA (2000) ", name: "NEVADA", year:2000},
         {content: "NEW ENGLAND LAW | BOSTON (1969)", name: "NEW ENGLAND LAW | BOSTON", year:1969}, # consider 'NEW ENGLAND LAW - BOSTON'
         {content: "PENNSYLVANIA STATE-Penn State Law (1931)", name: "PENNSYLVANIA STATE-PENN STATE LAW", year:1931}, # consider "PENNSYLVANIA STATE - PENN STATE LAW"
         {content: "ST. THOMAS (Florida) (1988)", name: "ST. THOMAS (FLORIDA)", year:1988},
         {content: "UNT Dallas (2017)", name: "UNT DALLAS", year:2017}
     ]
    }

    it "should parse the names and years of all the edge-cases" do
      links.each do |link|
        name, year = described_class.parse_link_content(link[:content])
        expect(name).to eql(link[:name])
        expect(year).to eql(link[:year])
      end
    end
  end

  #describe "parse_link_text" do
  #  let(:links){
  #    [
  #       {content: "AKRON (1961)", name: "AKRON", year:1961},
  #       {content: "ARIZONA SUMMIT(formerly Phoenix - 2007)", name: "ARIZONA SUMMIT", year:2007},
  #       {content: "CALIFORNIA - Berkeley (1923)", name: "CALIFORNIA - BERKELEY", year:1923},
  #       {content: "CONCORDIA (2015)*", name: "CONCORDIA", year:2015},
  #       {content: "LA VERNE (2006-2011; 2012)", name: "LA VERNE", year:2012},
  #       {content: "MITCHELL|HAMLINE (2015)", name: "MITCHELL|HAMLINE", year:2015}, # consider 'MITCHELL - HAMLINE'
  #       {content: "NEVADA (2000) ", name: "NEVADA", year:2000},
  #       {content: "NEW ENGLAND LAW | BOSTON (1969)", name: "NEW ENGLAND LAW | BOSTON", year:1969}, # consider 'NEW ENGLAND LAW - BOSTON'
  #       {content: "PENNSYLVANIA STATE-Penn State Law (1931)", name: "PENNSYLVANIA STATE-PENN STATE LAW", year:1931}, # consider "PENNSYLVANIA STATE - PENN STATE LAW"
  #       {content: "ST. THOMAS (Florida) (1988)", name: "ST. THOMAS (FLORIDA)", year:1988},
  #       {content: "UNT Dallas (2017)", name: "UNT DALLAS", year:2017}
  #   ]
  #  }
#
  #  it "should parse the names and years of all the edge-cases" do
  #    links.each do |link|
  #      name = described_class.link_name(link)
  #      expect(name).to eql(transformation[:clean])
  #    end
  #  end
  #end
end
