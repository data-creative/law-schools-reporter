class School < ApplicationRecord
  validates :uuid, {presence:true, uniqueness: true, numericality: { only_integer: true }}
  validates :long_name, {presence:true, uniqueness: true}
  validates :name, {presence:true, uniqueness: true}
  validates :url, {presence:true, uniqueness: true}
  validates :year_founded, {numericality: { only_integer: true }}

  NAME_MATCHES = [
    {school_name: 'ALBANY LAW SCHOOL', report_years: [2012], matching_uuid: 97, match_confidence: 0.8},
    {school_name: 'AVE MARIA', report_years: [2012], matching_uuid: 193, match_confidence: 0.8},
    {school_name: 'FLORIDA A&M', report_years: [2012], matching_uuid: 195, match_confidence: 0.8},
    {school_name: 'FLORIDA COASTAL', report_years: [2012], matching_uuid: 189, match_confidence: 0.8},
    {school_name: 'FLORIDA INTERNATIONAL', report_years: [2012], matching_uuid: 196, match_confidence: 0.8},
    {school_name: 'INDIANA UNIVERSITY MAURER SCHOOL OF LAW', report_years: [2012], matching_uuid: 51, match_confidence: 0.8},
    {school_name: 'WESTERN STATE', report_years: [2012], matching_uuid: 188, match_confidence: 0.8},
    {school_name: 'WHITTIER COLLEGE', report_years: [2012], matching_uuid: 167, match_confidence: 0.8},
    {school_name: 'WILLIAM AND MARY SCHOOL OF LAW', report_years: [2012], matching_uuid: 157, match_confidence: 0.8},
    {school_name: 'YESHIVA UNIVERSITY', report_years: [2012], matching_uuid: 168, match_confidence: 0.8},
    {school_name: 'WIDENER UNIVERSITY', report_years: [2012], matching_uuid: 26, match_confidence: 0.7},
    {school_name: 'WIDENER UNIVERSITY-HARRISBURG', report_years: [2012, 2013], matching_uuid: 179, match_confidence: 0.7}
  ]

  MIN_MATCH_CONFIDENCE = 0.7

  # @param [String] school_name like "AKRON, UNIVERSITY OF"
  # @return <School> or nil
  def self.find_by_names(school_name)
    school = where("name = ? OR long_name = ?", school_name, school_name).first

    unless school
      match = NAME_MATCHES.find{|m| m[:school_name] == school_name && m[:match_confidence] >= MIN_MATCH_CONFIDENCE}
      school = find_by_uuid(match.try(:[], :matching_uuid))
    end

    return school
  end

  # def matched_names
  #   NAME_MATCHES.select{|m| m[:matching_uuid] == uuid && m[:match_confidence] >= MIN_MATCH_CONFIDENCE}
  # end

  #def names
  #  [name, long_name, matched_names].flatten.uniq
  #end
end
