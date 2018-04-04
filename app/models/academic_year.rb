class AcademicYear < ApplicationRecord
  acts_as_paranoid

  has_and_belongs_to_many :students
  has_many :student_wise_discounts
  has_many :student_wise_fees
  has_many :student_fee_payments
  has_many :student_wise_fines
  has_many :student_wise_instant_fees
  has_many :attendances, dependent: :destroy

  def academic_year
    "#{start_year} - #{end_year}"
  end
end
