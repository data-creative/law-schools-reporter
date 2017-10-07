require 'rails_helper'

RSpec.describe Api::V1::EmploymentReportsController, type: :controller do

  # searched schools with a mix of matched and non-matched report years
  let!(:ss){ @ss ||= create(:school, :with_reports, uuid: 96, report_years: [2015, 2016, 2017]) }
  let!(:ss2){ @ss2 ||= create(:school, :with_reports, uuid: 78, report_years: [2015, 2016, 2017]) }
  let!(:ss3){ @ss3 ||= create(:school, :with_reports, uuid: 123, report_years: [2012, 2016]) }
  # non-matching schools
  let!(:xs){ @xs||= create(:school, :with_reports, uuid: 456, report_years: [2015, 2016, 2017] ) }

  let(:valid_session){ {} }
  let(:search_params){ {years: ["2016", "2017"], schools: [ss.uuid.to_s, ss2.uuid.to_s, ss3.uuid.to_s]} }
  let(:response){ get(:search, params: search_params.merge(format: 'json'), session: valid_session) }

  #before(:all) do
  #  @ss ||= create(:school, :with_reports, uuid: 96, report_years: [2015, 2016, 2017])
  #  @ss2 ||= create(:school, :with_reports, uuid: 78, report_years: [2015, 2016, 2017])
  #  @ss3 ||= create(:school, :with_reports, uuid: 123, report_years: [2012, 2016])
  #  @xs ||= create(:school, :with_reports, uuid: 123, report_years: [2015, 2016, 2017] )
  #end

  describe "GET #search" do
    it "returns a success response" do
      expect(response).to be_success
    end

    it "should exclude non-matching resources" do # ensures proper configuration of this test :-)
      expect(EmploymentReport.count).to eql(3 + 3 + 2 + 3)
    end

    it "should include matching resources" do
      expect(parsed_response.count).to eql(2 + 2 + 1)
    end
  end




  def parsed_response
    JSON.parse(response.body)
  end

end
