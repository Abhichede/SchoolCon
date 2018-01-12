class Division < ApplicationRecord
  has_many :students
  belongs_to :standard
  has_many :attendances
end
