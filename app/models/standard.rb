class Standard < ApplicationRecord
  has_many :subjects
  has_many :time_tables
  has_many :students
  has_many :divisions

  has_many :attendances
  has_many :fee_categories
end
