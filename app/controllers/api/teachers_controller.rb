module Api
  class TeachersController < Api::ApiController
    before_action :set_teacher, only: %i[show]

    def index
      @teachers = Teacher.all
    end

    def show; end

    private

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
  end
end