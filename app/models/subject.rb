class Subject < ApplicationRecord
  has_and_belongs_to_many :standards
  has_and_belongs_to_many :teachers
  has_many :attendances
end
