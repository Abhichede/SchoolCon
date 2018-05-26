module Api
  class NotificationsController < Api::ApiController
    before_action :set_notification, only: %i[show]

    def index
      if params[:student_id]
        @student = Student.find(params[:student_id])
        @notifications = @student.notifications
      else
        @notifications = Notification.all
      end
    end


    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end
  end
end