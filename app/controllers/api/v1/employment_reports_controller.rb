class Api::V1::EmploymentReportsController < ApplicationController

  # GET /api/v1/employment_reports
  # GET /api/v1/employment_reports.json
  #
  # GET /api/v1/employment_reports?years[]=2016&years[]=2017&schools[]=96&schools[]=132
  def index
    @reports = EmploymentReport.all
    @reports = @reports.where(year: years) if params[:years]
    @reports = @reports.where(school_uuid: school_uuids) if params[:schools]
  end

  private

  def school_uuids
    params.require(:schools)
  end

  def years
    params.require(:years)
  end
end
