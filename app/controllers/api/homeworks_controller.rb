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

    def create
      require "base64"
      if homework_params[:attachment] != ''
        image_str = "data:image/jpg;base64,#{homework_params[:attachment]}"

        homework_params[:attachment]  = image_str
      end

      @homework = Homework.new(homework_params)

      respond_to do |format|
        if @homework.save
          # format.html { redirect_to standard_path(@homework.standard), notice: 'Homework was successfully created.' }
          format.json { render json: {success: 'Homework created successfully.'} }
        else
          # format.html { render :new }
          format.json { render json: {error: 'Error occurred while saving.'} }
        end
      end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:name, :description, :standard_id, :attachment, :division_id, :date)
    end
  end
end