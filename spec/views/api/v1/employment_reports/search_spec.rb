require 'rails_helper'
require_relative "../../../../support/api/v1/view"

RSpec.describe "api/v1/employment_reports/search", type: :view do
  before(:each) do
    @reports = assign(:reports, [ create(:employment_report), create(:employment_report) ] )
    render
  end

  it "renders a list of reports" do
    expect(parsed_response.count).to eql(@reports.count)
    expect(parsed_response.first.keys).to match_array(
      [
        "school_uuid",
        "reported_school_name",
        "year",
        "total_grads",
        "total_employed",
        "employment_types",
        "employment_statuses",
        "employment_locations"
      ]
    )
  end
end
