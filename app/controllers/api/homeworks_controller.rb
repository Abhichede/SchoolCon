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
      unless homework_params[:attachment].blank?
        image_str = homework_params[:attachment].to_s
        image_str.gsub! 'data:image/png;base64', ''
        image_str.gsub! ' ', '+'
        decoded = Base64.decode64(image_str)
        # decoded = FilelessIO.new(decoded)
        homework_params[:attachment]  = decoded
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