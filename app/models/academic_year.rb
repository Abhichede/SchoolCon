class AcademicYear < ApplicationRecord
  has_many :students
  has_many :student_wise_discounts
  has_many :student_wise_fees
  has_many :student_fee_payments

  def academic_year
    "#{start_year} - #{end_year}"
  end
end
