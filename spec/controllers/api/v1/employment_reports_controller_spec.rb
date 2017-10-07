require 'rails_helper'

RSpec.describe Api::V1::EmploymentReportsController, type: :controller do
  #let!(:school1){ @school1 ||= create(:school, :with_reports, uuid: 98, report_years: [2015, 2016, 2017]) }
  #let!(:school2){ @school2 ||= create(:school, :with_reports, uuid: 76, report_years: [2011, 2012, 2016]) }
  #let!(:school3){ @school3 ||= create(:school, :with_reports, uuid: 23, report_years: [2015, 2016, 2017]) }

  let(:valid_session){ {} }
  let(:search_params){ {years: ["2016", "2017"], schools: ["98", "76"]} }
  let(:response){ get(:search, params: search_params.merge(format: 'json'), session: valid_session) }

  before(:all) do
    create(:school, :with_reports, uuid: 98, report_years: [2015, 2016, 2017])
    create(:school, :with_reports, uuid: 76, report_years: [2011, 2012, 2016])
    create(:school, :with_reports, uuid: 23, report_years: [2015, 2016, 2017])
  end

  describe "GET #search" do
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
