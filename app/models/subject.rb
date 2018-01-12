class Subject < ApplicationRecord
  belongs_to :standard
  has_and_belongs_to_many :teachers
  has_many :attendances
end
