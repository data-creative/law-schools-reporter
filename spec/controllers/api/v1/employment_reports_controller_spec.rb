require 'rails_helper'
require_relative "../../../support/api/v1/response"

RSpec.describe Api::V1::EmploymentReportsController, type: :controller do
  let(:valid_session){ {} }

  before(:all) do
    create(:school, :with_reports, uuid: 98, report_years: [2015, 2016, 2017]) # 2 matches
    create(:school, :with_reports, uuid: 76, report_years: [2011, 2012, 2016]) # 1 match
    create(:school, :with_reports, uuid: 23, report_years: [2015, 2016, 2017]) # 0 matches
  end

  describe "GET #index", "when not given any search parameters" do
    let(:response){ get(:index, params: {format: 'json'}, session: valid_session) }

    render_views # avoids JSON parsing error

    it "returns a success response" do
      expect(response).to be_success
    end

    it "should exclude non-matching resources" do # ensures proper configuration of this test :-)
      expect(EmploymentReport.count).to eql(3 + 3 + 3)
    end

    it "should include all resources" do
      expect(parsed_response.count).to eql(3 + 3 + 3)
    end
  end

  describe "GET #index", "when given both search parameters" do
    let(:search_params){ {years: ["2016", "2017"], schools: ["98", "76"]} }
    let(:response){ get(:index, params: search_params.merge(format: 'json'), session: valid_session) }

    render_views # avoids JSON parsing error

    it "returns a success response" do
      expect(response).to be_success
    end

    it "should exclude non-matching resources" do # ensures proper configuration of this test :-)
      expect(EmploymentReport.count).to eql(3 + 3 + 3)
    end

    it "should include matching resources" do
      expect(parsed_response.count).to eql(2 + 1 + 0)
    end
  end
end
