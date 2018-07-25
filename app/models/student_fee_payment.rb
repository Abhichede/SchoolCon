class StudentFeePayment < ApplicationRecord
  acts_as_paranoid

  belongs_to :student
  belongs_to :academic_year

  def current_academic_year
    academic_year.academic_year
  end
end
