class Standard < ApplicationRecord
  has_many :subjects
  has_and_belongs_to_many :teachers
  has_many :time_tables

end
