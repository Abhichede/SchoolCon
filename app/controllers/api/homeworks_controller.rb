module Api
  class HomeworksController < Api::ApiController

    def index
      if params[:student_id]
        @standard = Student.find(params[:student_id]).standards.last
        @homeworks = @standard.homeworks
      else
        @homeworks = Homework.all
      end
    end
  end
end