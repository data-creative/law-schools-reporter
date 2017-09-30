require 'rails_helper'

RSpec.describe Api::V1::SchoolsController, type: :controller do
  let(:valid_session) { }

  describe "GET #index" do
    it "returns a success response" do
      school = create(:school)
      get :index, params: {format: "json"}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      school = create(:school)
      get :show, params: {id: school.to_param, format: "json"}, session: valid_session
      expect(response).to be_success
    end
  end

end
