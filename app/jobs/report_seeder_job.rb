require "csv"

class ReportSeederJob < ApplicationJob
  queue_as :default

  def perform(options)
    years = options[:years] || (2012..2017).to_a

    puts "-------------------------------"
    puts "SEEDING EMPLOYMENT REPORTS"
    puts "-------------------------------"

    years.each do |year|
      csv_file_path = Rails.root.join("db/seeds/batch_employment_reports/#{year}.csv")
      csv_file = CSV.read(csv_file_path, headers: true)
      rows = csv_file.select{|row| !row["SchoolName"].blank? || !row["university"].blank?} # exclude three empty rows at bottom of 2013 file
      puts " ... #{year}: #{rows.count} ROWS"

      rows.each do |row|
        parsed_row = ParsedRow.new(year: year, row: row)

        report = EmploymentReport.where({
          school_name: parsed_row.school_name,
          year: parsed_row.year
        }).first_or_create

        begin
          report.update_attributes({
            total_grads: parsed_row.total_grads,
            total_employed: parsed_row.total_employed,
            employment_types: parsed_row.employment_types,
            employment_statuses: parsed_row.employment_statuses,
            employment_locations: parsed_row.employment_locations
          })
        rescue => e
          binding.pry
        end

      end
    end
  end
end

class UnexpectedNullInteger < StandardError ; end

class ParsedRow
  attr_accessor :year, :row

  def initialize(year:, row:)
    @year = year
    @row = row
  end

  def school_name
    row["SchoolName"]
  end

  def total_grads
    parse_int(row["TotalGraduatesNumber"])
  end

  def total_employed
    parse_int(row["Total"])
  end

  def employment_statuses
    {} # ehh who really cares about these?
  end

  def employment_types
    {
      law_firms:{
        solo: parse_int(row["Solo"]),
        step_10: parse_int(row["2-10"] || row["10-Feb"]), # accommodate XLS header naming errors for 2013, 2016, 2017
        step_25: parse_int(row["11-25"] || row["25-Nov"]), # accommodate XLS header naming errors for 2013, 2016, 2017
        step_50: parse_int(row["26-50"]),
        step_100: parse_int(row["51-100"]),
        step_250: parse_int(row["101-250"]),
        step_500: parse_int(row["251-500"]),
        over_500: parse_int(row["501-PLUS"]),
        unknown_size: parse_int(row["Unknown"])
      },
      business: parse_int(row["BusinessIndustry"]),
      government: parse_int(row["Government"]),
      public_interest: parse_int(row["PublicInterest"]),
      clerkships:{
        federal: parse_int(row["Federal"]),
        state_local: parse_int(row["StateLocal"]),
        other: parse_int(row["Other"])
      },
      academia: parse_int(row["Academia"] || row["Education"]), # accommodate 2013 header name
      unknown_type: parse_int(row["UnknownEmployerType"] || row["UnknownEmployerType Total"]) # accommodate 2012 header name difference
    }
  end

  def employment_locations
    [
      {
        label: "State of Largest Employment",
        location: row["FirstLargestEmployment"],
        count: parse_int(row["FirstLargestEmploymentNumber"]),
      },
      {
        label: "State of 2nd Largest Employment",
        location: row["SecondLargestEmployment"],
        count: parse_int(row["SecondLargestEmploymentNumber"])
      },
      {
        label: "State of 3rd Largest Employment",
        location: row["ThirdLargestEmployment"],
        count: parse_int(row["ThirdLargestEmploymentNumber"])
      },
      {
        label: "Employed in Foreign Countries",
        location: "Foreign Countries",
        count: parse_int(row["EmployedInForeignCountries"])
      }
    ]
  end

  def parse_int(val)
    raise UnexpectedNullInteger if val.nil? # if there is a nil, don't covert it to zero (which would happen if calling nil.to_i)
    return val.to_i
  end
end

=begin
class Parsed2017Row < ParsedRow ; end
class Parsed2016Row < ParsedRow ; end
class Parsed2015Row < ParsedRow ; end
class Parsed2014Row < ParsedRow ; end
class Parsed2013Row < ParsedRow ; end
class Parsed2012Row < ParsedRow ; end

class Parsed2011Row < ParsedRow
  def school_name
    row["university"]
  end

  def total_grads
    row["Total Graduates"]
  end

  def total_employed
    parse_int(row["Number Employed"])
  end

  def employment_types
    {
      law_firms:{
        solo: parse_int(row["Emp Solo "]), # yes there is a trailing space in this header
        step_10: parse_int(row["Emp 2-10"]),
        step_25: parse_int(row["Emp 11-25"]),
        step_50: parse_int(row["Emp 26-50"]),
        step_100: parse_int(row["Emp 51-100"]),
        step_250: parse_int(row["Emp 101-250"]),
        step_500: parse_int(row["Emp 251-500"]),
        over_500: parse_int(row["Emp 501+"]),
        size_unknown: parse_int(row["Emp Type Unk"]), # this duplicate header needs disambiguation before becoming usable)
      },
      business: parse_int(row["Bus & Ind"]),
      government: parse_int(row["Government"]),
      public_interest: parse_int(row["Public Interest"]),
      clerkships:{
        federal: parse_int(row["Federal"]),
        state_local: parse_int(row["State & local"]),
        other: nil # does not exist for 2011, ok to be null, not technically zero. need to think more about how appropriate it would be to coalesce this to zero.
      },
      academia: parse_int(row["Academia"]),
      employer_type_unknown: parse_int(row["Emp Type Unk"]),  # this duplicate header needs disambiguation before becoming usable)
    }
  end

  def employment_locations
    [
      {
        label: "State of Largest Employment",
        location: row["State 1 Lrgst Emp"],
        count: parse_int(row["State 1 Lrgst Emp Num"])
      },
      {
        label: "State of 2nd Largest Employment",
        location: row["State 2 Lrgst Emp"],
        count: parse_int(row["State 2 Lrgst Emp Num"])
      },
      {
        label: "State of 3rd Largest Employment",
        location: row["State 3 Lrgst Emp"],
        count: parse_int(row["State 3 Lrgst Emp Num"])
      },
      {
        label: "Employed in Foreign Countries",
        location: "Foreign Countries",
        count: parse_int(row["Emp Forgn Countries"])
      }
    ]
  end
end
=end
