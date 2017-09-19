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
      puts " ... #{year}: #{rows.count} ROWS"

      rows.each do |row|
        standard_row = StandardRow.new(year: year, row: row)

        report = EmploymentReport.where({
          school_name: standard_row.school_name,
          year: standard_row.year
        }).first_or_create

        report.update_attributes({
          total_grads: standard_row.total_grads,
          total_employed: standard_row.total_employed,
          employment_types: standard_row.employment_types,
          employment_statuses: standard_row.employment_statuses,
          employment_locations: standard_row.employment_locations
        })
      end
    end
  end
end

class UnexpectedNullInt < StandardError ; end

class StandardRow
  attr_accessor :year, :row

  def initialize(year:, row:)
    @year = year
    @row = row
  end

  def school_name
    row["SchoolName"] || row["university"] # accommodate 2011 header name
  end

  def total_grads
    parse_int(row["TotalGraduatesNumber"] || row["Total Graduates"]) # accommodate 2011 header name
  end

  def total_employed
    parse_int(row["Total"] || row["Number Employed"]) # accommodate 2011 header name
  end

  def employment_statuses
    {} # ehh who really cares about these?
  end

  def employment_types
    binding.pry
    {
      law_firms:{
        solo: parse_int(row["Solo"] || row["Emp Solo "]), # accommodate 2011 header name
        step_10: parse_int(row["2-10"] || row["10-Feb"] || row["Emp 2-10"]), # accommodate XLS header naming errors for 2013, 2016, 2017; # accommodate 2011 header name
        step_25: parse_int(row["11-25"] || row["25-Nov"] || row["Emp 11-25"]), # accommodate XLS header naming errors for 2013, 2016, 2017; # accommodate 2011 header name
        step_50: parse_int(row["26-50"] || row["Emp 26-50"]), # accommodate 2011 header name
        step_100: parse_int(row["51-100"] || row["Emp 51-100"]), # accommodate 2011 header name
        step_250: parse_int(row["101-250"] || row["Emp 101-250"]), # accommodate 2011 header name
        step_500: parse_int(row["251-500"] || row["Emp 251-500"]), # accommodate 2011 header name
        over_500: parse_int(row["501-PLUS"] || row["Emp 501+"]), # accommodate 2011 header name
        size_unknown: parse_int(row["Unknown"] || row["Emp Type Unk"]), # accommodate 2011 header name (renamed to disambiguate duplicate header names)
      },
      business: parse_int(row["BusinessIndustry"] || row["Bus & Ind"]), # accommodate 2011 header name
      government: parse_int(row["Government"]),
      public_interest: parse_int(row["PublicInterest"] || row["Public Interest"]),
      clerkships:{
        federal: parse_int(row["Federal"]),
        state_local: parse_int(row["StateLocal"] || row["State & local"]), # accommodate 2011 header name
        other: (year == 2011 ? row["Other"] : parse_int(row["Other"])) # does not exist for 2011, ok to be null, but not technically zero. EDIT: maybe zero is ok for 2011.
      },
      academia: parse_int(row["Academia"]),
      employer_type_unknown: parse_int(row["UnknownEmployerType"] || row["Emp Type Unk"]),
    }
  end

  def employment_locations
    [
      {
        label: "State of Largest Employment",
        location: row["FirstLargestEmployment"] || row["State 1 Lrgst Emp"], # accommodate 2011 header name
        count: parse_int(row["FirstLargestEmploymentNumber"] || row["State 1 Lrgst Emp Num"]) # accommodate 2011 header name
      },
      {
        label: "State of 2nd Largest Employment",
        location: row["SecondLargestEmployment"] || row["State 2 Lrgst Emp"], # accommodate 2011 header name
        count: parse_int(row["SecondLargestEmploymentNumber"] || row["State 2 Lrgst Emp Num"]) # accommodate 2011 header name
      },
      {
        label: "State of 3rd Largest Employment",
        location: row["ThirdLargestEmployment"] || row["State 3 Lrgst Emp"], # accommodate 2011 header name
        count: parse_int(row["ThirdLargestEmploymentNumber"] || row["State 3 Lrgst Emp Num"]) # accommodate 2011 header name
      },
      {
        label: "Employed in Foreign Countries",
        location: "Foreign Countries",
        count: parse_int(row["EmployedInForeignCountries"] || row["Emp Forgn Countries"]) # accommodate 2011 header name
      }
    ]
  end

  def parse_int(val)
    raise UnexpectedNullInt if val.nil? # if there is a nil, don't covert it to zero (results of calling .to_i on it)
    return val.to_i
  end
end

# consider making a class for each year if more serious discrepencies arise in future years
#
# class 2011Row < StandardRow
#   def school_name
#     row["university"]
#   end
#
#   def total_grads
#     row["Total Graduates"]
#   end
# end
