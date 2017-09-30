class HomeController < ApplicationController
  def index
    @random_school_uuid = School.pluck(:uuid).sample
  end
end
