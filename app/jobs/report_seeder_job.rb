require "csv"

class ReportSeederJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "SEEDING EMPLOYMENT REPORTS"

    (2011..2017).to_a.each do |year|
      csv_file_path = Rails.root.join("db/seeds/batch_employment_reports/#{year}.csv")

      csv_file = CSV.read(csv_file_path, headers: true)

      batch = csv_file.select{|row| !row["SchoolName"].blank? || !row["university"].blank?} # exclude three empty rows at bottom of 2013 file

      puts " + #{year} -- #{csv_file.headers.count} HEADERS -- #{batch.count}/#{csv_file.count} ROWS"

      batch.each do |row|

        report = EmploymentReport.where({
          school_name: (row["SchoolName"] || row["university"]),
          year: year
        }).first_or_create

        report.update_attributes({
          total_grads: (row["TotalGraduatesNumber"] || row["Total Graduates"])
        })

      end
    end
  end
end
