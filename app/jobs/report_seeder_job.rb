require "csv"

class ReportSeederJob < ApplicationJob
  queue_as :default

  def perform(options)
    years = options[:years] || (2011..2017).to_a

    puts "-------------------------------"
    puts "SEEDING EMPLOYMENT REPORTS"
    puts "-------------------------------"

    years.each do |year|
      csv_file_path = Rails.root.join("db/seeds/batch_employment_reports/#{year}.csv")
      csv_file = CSV.read(csv_file_path, headers: true)
      rows = csv_file.select{|row| !row["SchoolName"].blank? || !row["university"].blank?} # exclude three empty rows at bottom of 2013 file
      #puts " ... #{year}, HEADERS: #{csv_file.headers.count}, ROWS: #{rows.count}/#{csv_file.count}"
      rows.each do |row|
        #binding.pry if year == 2016
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
