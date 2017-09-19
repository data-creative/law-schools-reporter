class EmploymentReport < ApplicationRecord
  serialize(:employment_statuses, Hash)
  serialize(:employment_types, Hash)
  serialize(:employment_locations, Hash)
end
