module Api
  class StudentsController < Api::ApiController
    before_action :set_student, only: %i[show]

    def index
      @students = Student.all
    end


    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
  end
end