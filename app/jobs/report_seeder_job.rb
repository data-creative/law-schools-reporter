require "csv"

class ReportSeederJob < ApplicationJob
  queue_as :default

  def perform(options)
    years = options[:years] || (2011..2017).to_a

    puts "-------------------------------"
    puts "SEEDING EMPLOYMENT REPORTS"
    puts "-------------------------------"

    years.each do |year|
      puts year

      csv_file_path = Rails.root.join("db/seeds/batch_employment_reports/#{year}.csv")
      csv_file = CSV.read(csv_file_path, headers: true)
      rows = csv_file.select{|row| !row["SchoolName"].blank? || !row["university"].blank?} # exclude three empty rows at bottom of 2013 file

      headers = parse_headers(csv_file.headers)
      puts "HEADERS (#{headers.count})"
      #pp headers

      puts "ROWS (#{rows.count}/#{csv_file.count})"
      rows.each do |row|
        report = EmploymentReport.where({
          school_name: parse_school_name(row),
          year: year
        }).first_or_create

        report.update_attributes({
          total_grads: parse_total_grads(row),
          total_employed: parse_total_employed(row),
          employment_types: {}, # todo
          employment_statuses: parse_employment_statuses(row),
          employment_locations: {} # todo
        })
      end

      puts "-------------------------------"
    end
  end

  private

  #
  # PREPARE THESE METHODS FOR CONDITIONAL OUTPUTS DEPENDING ON YEAR
  # ... WILL LIKELY BE INSTANCE METHODS FOR A NEW "ROW" CLASS
  #

  def parse_headers(all_headers)
    return all_headers.compact.reject{ |header|
      header.include?("FTLT") || header.include?("FTST") ||
      header.include?("PTLT") || header.include?("PTST") ||
      header.include?("FullTimeLongTerm") || header.include?("FullTimeShortTerm") ||
      header.include?("PartTimeLongTerm") || header.include?("PartTimeShortTerm") ||
      header.include?("Funded_")
    } # use `.compact` to get rid of ~2000 nil columns in year 2013
  end

  def parse_total_grads(row)
    return (row["TotalGraduatesNumber"] || row["Total Graduates"])
  end

  def parse_total_employed(row)
    return row["Total"]
  end

  def parse_school_name(row)
    return (row["SchoolName"] || row["university"])
  end

  def parse_employment_statuses(row)
    return {
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
    }
  end
end
