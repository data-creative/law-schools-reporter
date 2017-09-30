require 'rails_helper'

RSpec.describe "Api::V1::Schools", type: :request do
  describe "GET /api/v1/schools" do
    it "is successful" do
      get api_v1_schools_path
      expect(response).to have_http_status(200)
    end
  end
end
