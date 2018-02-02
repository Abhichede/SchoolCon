class StudentWiseFee < ApplicationRecord
  belongs_to :student
  belongs_to :academic_year
end
