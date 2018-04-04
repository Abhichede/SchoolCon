class StudentFeePayment < ApplicationRecord
  acts_as_paranoid

  belongs_to :student
  belongs_to :academic_year
end
