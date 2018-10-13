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
        @homeworks = Homework.all.order("date DESC")
      end
    end

    def create
      @homework = Homework.new(homework_params)
      if homework_params[:attachment] != ''
        io = StringIO.new(Base64.decode64(homework_params[:attachment]))
        filename = homework_params[:filename]
        if filename.include? ".jpg"
          def io.original_filename; "pic.jpg"; end
        elsif filename.include? ".pdf"
          def io.original_filename; "doc.pdf"; end
        elsif filename.include? ".png"
          def io.original_filename; "pic.png"; end
        elsif filename.include? ".jpeg"
          def io.original_filename; "pic.jpeg"; end
        end

        @homework.update_attributes attachment: io
      end



      respond_to do |format|
        if @homework.save

          @division = Division.find(homework_params[:division_id])

          device_ids = []
          @division.students.each do |student|
            @user = User.where(username: student.father_mobile).last

            unless device_ids.include?(@user.device_id)
              device_ids << @user.device_id
            end
          end

          require 'fcm'
          fcm = FCM.new(ENV['FCM_SERVER_KEY'])
          # fcm = init_fcm
          options = {
              priority: "high",
              collapse_key: "updated_score",
              notification: {
                  title: "New Homework",
                  body: @homework.name
              }
          }
          response = fcm.send(device_ids, options)

          puts response
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
      params.require(:homework).permit(:name, :description, :standard_id, :attachment, :division_id, :date, :filename)
    end
  end
end