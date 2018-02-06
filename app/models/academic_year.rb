class AcademicYear < ApplicationRecord
  has_many :students
  has_many :student_wise_discounts
  has_many :student_wise_fees
  has_many :student_fee_payments
  has_many :student_wise_fines
  has_many :student_wise_instant_fees

  def academic_year
    "#{start_year} - #{end_year}"
  end
end
