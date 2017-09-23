class School < ApplicationRecord
  serialize(:alt_names, Array)

  validates :url, {presence:true, uniqueness: true}
  validates :name, {presence:true}
  validates :year, {presence:true, numericality: { only_integer: true }}
end
