module Api
  class StudentsController < Api::ApiController

    def index
      @students = Student.all
    end
  end
end