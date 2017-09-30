class Api::V1::SchoolsController < ApplicationController

  # GET /api/v1/schools
  # GET /api/v1/schools.json
  def index
    @schools = School.all
  end

  # GET /api/v1/schools/1
  # GET /api/v1/schools/1.json
  def show
    @school = School.find(params[:id])
  end

end
