class AcademicYear < ApplicationRecord
  has_many :students

  def academic_year
    "#{start_year} - #{end_year}"
  end
end
