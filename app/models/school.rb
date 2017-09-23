class School < ApplicationRecord
  include SchoolNameMatch

  validates :uuid, {presence:true, uniqueness: true, numericality: { only_integer: true }}
  validates :long_name, {presence:true, uniqueness: true}
  validates :name, {presence:true, uniqueness: true}
  validates :url, {presence:true, uniqueness: true}
  validates :year_founded, {numericality: { only_integer: true }}

  # @param [String] school_name like "AKRON, UNIVERSITY OF"
  # @return <School> or nil
  def self.matches_name(school_name)
    match = where("name = ? OR long_name = ?", school_name, school_name).first
    unless match
      lookup = SchoolNameMatch.find_by_school_name(school_name)
      if lookup
        match = find_by_uuid(lookup[:matching_uuid])
      end
    end
    return match
  end

  #def names
  #  [name, long_name, matched_names].flatten.uniq
  #end

  #def employment_reports
  #  EmploymentReport.where(:school_name => names)
  #end

  #def report_years
  #  employment_reports
  #end
end
