class HomeController < ApplicationController
  def index
    random_uuid = School.pluck(:uuid).sample
    @random_school = School.find_by_uuid(random_uuid)
  end
end
