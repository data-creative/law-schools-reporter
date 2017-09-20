class EmploymentReport < ApplicationRecord
  serialize(:employment_statuses, Hash)
  serialize(:employment_types, Hash)
  serialize(:employment_locations, Array)

  validates :year, {presence:true, numericality: { only_integer: true }}
  validates :school_name, {presence:true, uniqueness: {scope: :year}}
  # consider also validating presence and numericality of all nested counts. because they are nested, that gets a little complicated.

  def self.with_grads
    where("total_grads <> 0")
  end
end
