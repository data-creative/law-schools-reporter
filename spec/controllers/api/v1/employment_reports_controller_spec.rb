require 'rails_helper'

RSpec.describe Api::V1::EmploymentReportsController, type: :controller do
  let(:valid_session){ {} }
  let(:search_params){ {years: ["2016", "2017"], schools: ["98", "76"]} }
  let(:response){ get(:search, params: search_params.merge(format: 'json'), session: valid_session) }

  before(:all) do
    create(:school, :with_reports, uuid: 98, report_years: [2015, 2016, 2017]) # 2 matches
    create(:school, :with_reports, uuid: 76, report_years: [2011, 2012, 2016]) # 1 match
    create(:school, :with_reports, uuid: 23, report_years: [2015, 2016, 2017]) # 0 matches
  end

  describe "GET #search" do
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




  def parsed_response
    JSON.parse(response.body)
  end

end
