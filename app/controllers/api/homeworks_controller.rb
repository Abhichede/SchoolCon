module Api
  class HomeworksController < Api::ApiController

    def index
      if params[:student_id] && params[:date]
        @division = Student.find(params[:student_id]).divisions.last
        @homeworks = @division.homeworks.where(date: params[:date])
      else
        @homeworks = Homework.all
      end
    end
  end
end