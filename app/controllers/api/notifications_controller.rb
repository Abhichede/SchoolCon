module Api
  class NotificationsController < Api::ApiController
    before_action :set_notification, only: %i[show]

    def index
      if params[:student_id]
        @student = Student.find(params[:student_id])
        @notifications = @student.notifications.order("created_at DESC")
      else
        @notifications = Notification.all.order("created_at DESC")
      end
    end


    def show; end

    # POST /notifications
    # POST /notifications.json
    def create
      if notification_params[:notification_type] === 'division_wise'
        @division = Division.find(notification_params[:type_data])
        @division.students.each do |student|
          @notification = Notification.new(title: notification_params[:title],
                                           message: notification_params[:message],
                                           from: notification_params[:from], student_id: student.id)

          @notification.save
          if notification_params[:by_mail] == '1'
            unless @notification.student.student_email.blank?
              NotificationMailer.notify_student(@notification.student, @notification).deliver
            end
          end
          if notification_params[:by_sms] == '1'
            send_sms_to_parent(@notification.student, @notification)
          end
        end

        respond_to do |format|
          format.json { render json: {success: true, message: 'Message send successfully.'}}
        end
      elsif notification_params[:notification_type] === 'standard_wise'
        @standard = Standard.find(notification_params[:type_data])
        @standard.divisions.each do |division|
          division.students.each do |student|
            @notification = Notification.new(title: notification_params[:title],
                                             message: notification_params[:message],
                                             from: notification_params[:from], student_id: student.id)

            @notification.save
            if notification_params[:by_mail] == '1'
              unless @notification.student.student_email.blank?
                NotificationMailer.notify_student(@notification.student, @notification).deliver
              end
            end
            if notification_params[:by_sms] == '1'
              send_sms_to_parent(@notification.student, @notification)
            end
          end
        end
        respond_to do |format|
          format.json { render json: {success: true, message: 'Message send successfully.'}}
        end
      elsif notification_params[:notification_type] === 'to_all'
        Student.all.each do |student|
          @notification = Notification.new(title: notification_params[:title],
                                           message: notification_params[:message],
                                           from: notification_params[:from], student_id: student.id)

          @notification.save
          if notification_params[:by_mail] == '1'
            unless @notification.student.student_email.blank?
              NotificationMailer.notify_student(@notification.student, @notification).deliver
            end
          end
          if notification_params[:by_sms] == '1'
            send_sms_to_parent(@notification.student, @notification)
          end
        end

        respond_to do |format|
          format.json { render json: {success: true, message: 'Message send successfully.'}}
        end
      elsif notification_params[:notification_type] === 'student_wise'
        notification_params[:student_id] = notification_params[:type_data]
        @notification = Notification.new(title: notification_params[:title],
                                         message: notification_params[:message],
                                         from: notification_params[:from], student_id: notification_params[:type_data])

        @notification.save
        if notification_params[:by_mail] == '1'
          unless @notification.student.student_email.blank?
            NotificationMailer.notify_student(@notification.student, @notification).deliver
          end
        end
        if notification_params[:by_sms] == '1'
          send_sms_to_parent(@notification.student, @notification)
        end
        respond_to do |format|
          format.json { render json: {success: true, message: 'Message send successfully.'}}
        end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:title, :message, :from, :student_id, :notification_type, :type_data, :by_sms, :by_mail)
    end
  end
end