class School < ApplicationRecord
  validates :uuid, {presence:true, uniqueness: true, numericality: { only_integer: true }}
  validates :long_name, {presence:true, uniqueness: true}
  validates :name, {presence:true, uniqueness: true}
  validates :url, {presence:true, uniqueness: true}
  validates :year_founded, {numericality: { only_integer: true }}
end
