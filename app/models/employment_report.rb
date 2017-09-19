class EmploymentReport < ApplicationRecord
  serialize(:findings, Hash)
end
