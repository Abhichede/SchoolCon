class Division < ApplicationRecord
  has_and_belongs_to_many :students
  belongs_to :standard
  has_many :attendances
end
