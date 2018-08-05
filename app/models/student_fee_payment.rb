class StudentFeePayment < ApplicationRecord
  acts_as_paranoid

  belongs_to :student
  belongs_to :academic_year

  def current_academic_year
    if academic_year
      academic_year.academic_year
    else
      payment_date.to_date.year
    end
  end

  def date
    payment_date.strftime("%d-%b-%Y")
  end
end
