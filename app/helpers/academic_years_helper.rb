module AcademicYearsHelper

  def current_year
    @academic_year = AcademicYear.find_by_is_active(true)

    @academic_year.academic_year
  end
end
