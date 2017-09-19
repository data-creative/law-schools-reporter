class EmploymentReport < ApplicationRecord
  serialize(:employment_statuses, Hash)
  serialize(:employment_types, Hash)
  serialize(:employment_locations, Array)

  validates :year, {presence:true, numericality: { only_integer: true }}
  validates :school_name, {presence:true, uniqueness: {scope: :year}}
end
