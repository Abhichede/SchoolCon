class Teacher < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :standard
  has_many :time_tables
end
