class Api::V1::EmploymentReportsController < ApplicationController

  # GET /api/v1/reports
  # GET /api/v1/reports.json
  #
  # GET /api/v1/reports?years[]=2016&years[]=2017&schools[]=96&schools[]=132
  def search
    @reports = EmploymentReport.where(year: years, school_uuid: school_uuids)
  end

  private

  def school_uuids
    params.require(:schools)
  end

  def years
    params.require(:years)
  end
end
