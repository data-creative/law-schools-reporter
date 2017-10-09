class EmploymentReport < ApplicationRecord
  serialize(:employment_statuses, Hash)
  serialize(:employment_types, Hash)
  serialize(:employment_locations, Array)

  validates :year, {presence:true, numericality: { only_integer: true }}
  validates :school_name, {presence:true, uniqueness: {scope: :year}}

  def self.with_grads
    where("total_grads <> 0")
  end

  def reported_school_name
    school_name
  end

  #def real_school_name
  #  school.try(:name)
  #end
end
