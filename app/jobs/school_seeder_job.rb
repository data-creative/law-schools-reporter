require "csv"

class SchoolSeederJob < ApplicationJob
  queue_as :default

  def perform
    announce("SEEDING SCHOOLS (#{csv_file.count})")

    csv_file.each do |row|
      log("  + #{row["name"]} (#{row["year_founded"]})")
      school = School.where(uuid: row["uuid"]).first_or_initialize
      school.update_attributes({
        long_name: row["long_name"],
        name: row["name"],
        year_founded: row["year_founded"],
        url: row["url"],
        reports_url: row["reports_url"]
      })
    end
  end

  def csv_file_path
    Rails.root.join("db/seeds/schools.csv")
  end

  def csv_file
    @csv_file ||= CSV.read(csv_file_path, headers: true)
  end
end
