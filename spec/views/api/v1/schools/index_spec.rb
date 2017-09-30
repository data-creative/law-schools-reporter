require 'rails_helper'
#require_relative "../../../../support/api/v1/view"

RSpec.describe "api/v1/schools/index", type: :view do
  before(:each) do
    @schools = assign(:schools, [ create(:school), create(:school) ] )
    render
  end

  let(:response){ JSON.parse(rendered) }

  it "renders a list of schools" do
    expect(response.count).to eql(@schools.count)
  end
end
