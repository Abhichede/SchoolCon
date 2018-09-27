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
      unless homework_params[:attachment].blank?
        image_str = homework_params[:attachment]
        decoded = Base64.decode64(image_str)
        # decoded = FilelessIO.new(decoded)

        prefix = 'mydata'
        suffix = '.jpg'
        tempfile = Tempfile.new [prefix, suffix], "#{Rails.root}/tmp"

        tempfile.binmode
        tempfile.write(decoded)

        uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :content_type => 'image/jpg',:filename => 'pic.jpg', :original_filename => 'pic.jpg')
        puts "UploadParams #{uploaded_file}"
        homework_params[:attachment]  = uploaded_file
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