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
      puts " ... #{year} -- #{csv_file.headers.count} HEADERS -- #{rows.count}/#{csv_file.count} ROWS"
      rows.each do |row|

        report = EmploymentReport.where({
          school_name: (row["SchoolName"] || row["university"]),
          year: year
        }).first_or_create

        employment_statuses = {
          law_firms:{
            solo: row["Solo"],
            step_10: row["2-10"] || row["10-Feb"],
            step_25: row["11-25"] || row["25-Nov"],
            step_50: row["26-50"],
            step_100: row["51-100"],
            step_250: row["101-250"],
            step_500: row["251-500"],
            over_500: row["501-PLUS"],
            unknown: row["Unknown"],
          },
          business: row["BusinessIndustry"],
          government: row["Government"],
          public_interest: row["PublicInterest"],
          clerkships:{
            federal: row["Federal"],
            state_local: row["StateLocal"],
            other: row["Other"]
          },
          academia: row["Academia"],
          unknown: row["UnknownEmployerType"],
        } #.deep_stringify_keys

        report.update_attributes({
          total_grads: (row["TotalGraduatesNumber"] || row["Total Graduates"]),
          total_employed: row["Total"],
          employment_types: {}, # todo
          employment_statuses: employment_statuses,
          employment_locations: {} # todo
        })

      end
    end
  end
end
