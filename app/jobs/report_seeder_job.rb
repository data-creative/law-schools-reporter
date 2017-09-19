require "csv"

class ReportSeederJob < ApplicationJob
  queue_as :default

  def perform(*args)
    year = 2017
    csv_file_path = Rails.root.join("db/seeds/batch_employment_reports/#{year}.csv")

    batch = CSV.read(csv_file_path, headers: true)
    batch.each do |row|
      report = EmploymentReport.first_or_create({
        school_name: row["SchoolName"],
        year: year
      })
      report.update_attributes({total_grads: row["TotalGraduatesNumber"]})
    end
  end
end
