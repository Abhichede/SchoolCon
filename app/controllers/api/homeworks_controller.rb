module Api
  class HomeworksController < Api::ApiController
    def index
      if params[:student_id] && params[:date]
        @division = Student.find(params[:student_id]).divisions.last
        @homeworks = @division.homeworks.where(date: params[:date])
      elsif params[:standard_id] && params[:division_id]
        @division = Division.find(params[:division_id])
        @homeworks = @division.homeworks.order("date DESC")
      else
        @homeworks = Homework.all
      end
    end

    def create
      @homework = Homework.new(homework_params)
      if homework_params[:attachment] != ''
        io = StringIO.new(Base64.decode64(homework_params[:attachment]))
        def io.original_filename; "pic.jpg"; end

        puts io.original_filename

        homework_params[:attachment]  = io

        @homework.update_attributes attachment: io
      end



      respond_to do |format|
        if @homework.save
          # format.html { redirect_to standard_path(@homework.standard), notice: 'Homework was successfully created.' }
          format.json { render json: {success: 'Homework created successfully.'} }
        else
          # format.html { render :new }
          format.json { render json: {error: 'Homework not created successfully.'} }
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