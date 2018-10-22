module Api
  class AttendancesController < Api::ApiController
    before_action :set_attendance, only: %i[show]
    before_action :set_academic_year

    def index
      @academic_year = AcademicYear.where(is_active: true).last
      if !params[:student_id].blank? && !params[:date].blank?
        first_date_of_month = Date.parse(params[:date]).beginning_of_month
        last_date_of_month = Date.parse(params[:date]).end_of_month
        @student = Student.find(params[:student_id])
        @division = @student.divisions.last
        @attendances = @division.attendances.where(academic_year_id: @academic_year.id, date: params[:date])

        @attendances_monthly_summary = @division.attendances.where("academic_year_id = ? AND date BETWEEN ? AND ?", @academic_year.id, first_date_of_month, last_date_of_month)
      else
        @attendances = Attendance.where(academic_year_id: @academic_year.id).order("date DESC")
      end
    end


    def show; end


    def create
      @attendance = Attendance.new(attendance_params)

      @duplicate = Attendance.where(:standard_id => attendance_params[:standard_id],
                                    :division_id => attendance_params[:division_id],
                                    :date => attendance_params[:date])

      respond_to do |format|
        if @duplicate.count > 0
          @attendance = @duplicate.first
          format.json { render json: {success: false, error: 'Attendance already taken'}}
        else
          if @attendance.save
            @attendance.division.students.where(is_enquiry: false).each do |student|
              unless @attendance.att_data["#{student.id}"] === 'on'
                absent_message = MyTemplate.find_by_name('Student Absent Message').desc
                absent_message.gsub! '#{student_name}', student.self_full_name
                send_sms_to_parent(student, Notification.new(message: ActionController::Base.helpers.strip_tags(absent_message)))

                require 'fcm'
                fcm = FCM.new(ENV['FCM_SERVER_KEY'])
                # fcm = init_fcm
                @user = User.where(username: student.father_mobile).last
                device_id = @user.device_id
                registration_ids= [device_id] # an array of one or more client registration tokens
                options = {
                    priority: "high",
                    collapse_key: "updated_score",
                    notification: {
                        title: "Attendance",
                        body: ActionController::Base.helpers.strip_tags(absent_message)
                    }
                }
                response = fcm.send(registration_ids, options)

                puts response
              end
            end
            # format.html { redirect_to attendances_path(standard_id: @attendance.standard_id, division: @attendance.division_id,
            #                                            subject: @attendance.subject_id, date: @attendance.date),
            #                           notice: 'Attendance was successfully created.' }
            format.json { render json: {success: true, message: "Attendance Submitted successfully"} }
          else
            # format.html { render :new }
            @attendance.errors.full_messages.each do |msg|
              puts msg
            end
            format.json { render json: {success: false, error: "Something went wrong while saving, please check all mandatory fields are filled."} }
          end
        end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def set_academic_year
      @academic_year = AcademicYear.find_by(is_active: true)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:date, :subject_id, :standard_id, :division_id, :academic_year_id, :teacher_id, :att_data => [].to_h)
    end
  end
end