module Api
  class AttendancesController < Api::ApiController
    before_action :set_attendance, only: %i[show]

    def index
      @academic_year = AcademicYear.where(is_active: true).last
      if params[:division_id]
        @division = Division.find(params[:division_id])
        @attendances = @division.attendances.where(academic_year_id: @academic_year.id)
      else
        @attendances = Attendance.where(academic_year_id: @academic_year.id)
      end
      @student = Student.find(params[:student_id]) if params[:student_id]
    end


    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end
  end
end