require 'rails_helper'
#require_relative "../../../../support/api/v1/view"

RSpec.describe "api/v1/schools/show", type: :view do
  before(:each) do
    @school = assign(:school, create(:school))
    render
  end

  let(:response){ JSON.parse(rendered) }

  it "renders the given school" do
    expect(response.keys).to match_array([
      "id", "created_at", "updated_at", # not the most important to be included, but why not?
      "uuid", "year_founded",
      "long_name", "name",
      "url", "reports_url"
    ]) # , "report_years"
  end
end
