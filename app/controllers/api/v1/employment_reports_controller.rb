class Api::V1::EmploymentReportsController < ApplicationController

  # GET /api/v1/employment_reports/search
  # GET /api/v1/employment_reports/search.json
  #
  # GET /api/v1/employment_reports/search?years[]=2016&years[]=2017&schools[]=96&schools[]=132
  def search
    @reports = EmploymentReport.where(search_params.to_h)
  end

  private

  def search_params
    params.permit([:years, :schools])
  end
end
