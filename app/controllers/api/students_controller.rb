module Api
  class StudentsController < Api::ApiController
    before_action :set_student, only: %i[show]

    def index
      if params[:division_id]
        @division = Division.find(params[:division_id])
        @students = @division.students
      else
        @students = Student.all
      end
    end

    def student_fee_summary
      if params[:student_id]
        @student = Student.find(params[:student_id])
        @academic_year = AcademicYear.find_by_is_active(true)
      end
    end

    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
  end
end