class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.with_deleted.all
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end


  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    device_ids = []
    if notification_params[:notification_type] === 'division_wise'
      @division = Division.find(notification_params[:type_data])
      @division.students.each do |student|
        @notification = Notification.new(title: notification_params[:title],
                                         message: notification_params[:message],
                                         from: notification_params[:from], student_id: student.id)

        @user = User.where(username: student.father_mobile).last
        unless device_ids.include?(@user.device_id)
          device_ids << @user.device_id
        end

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

      if notification_params[:by_app] == '1'

        puts device_ids
        require 'fcm'
        fcm = FCM.new(ENV['FCM_SERVER_KEY'])
        # fcm = init_fcm
        # @student = Student.find(notification_params[:student_id])
        # @user = User.where(username: @student.father_mobile).last
        # device_id = @user.device_id
        # registration_ids= [device_id] # an array of one or more client registration tokens
        options = {
            priority: "high",
            collapse_key: "updated_score",
            notification: {
                title: @notification.title,
                body: @notification.message
            }
        }
        response = fcm.send(device_ids, options)

        puts response
      end

      respond_to do |format|
        format.html { redirect_to session.delete(:return_to), notice: "Notification was sent successfully to All from division #{@division.name}." }
        format.json { render :show, status: :created, location: @notification }
      end
    elsif notification_params[:notification_type] === 'standard_wise'
      counter = 0
      device_ids = []
      @standard = Standard.find(notification_params[:type_data])
      @standard.divisions.each do |division|
        division.students.each do |student|
          @notification = Notification.new(title: notification_params[:title],
                                           message: notification_params[:message],
                                           from: notification_params[:from], student_id: student.id)


          @user = User.where(username: student.father_mobile).last
          unless device_ids.include?(@user.device_id)
            device_ids << @user.device_id
          end
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

        if notification_params[:by_app] == '1'

          puts device_ids
          require 'fcm'
          fcm = FCM.new(ENV['FCM_SERVER_KEY'])
          # fcm = init_fcm
          # @student = Student.find(notification_params[:student_id])
          # @user = User.where(username: @student.father_mobile).last
          # device_id = @user.device_id
          # registration_ids= [device_id] # an array of one or more client registration tokens
          options = {
              priority: "high",
              collapse_key: "updated_score",
              notification: {
                  title: @notification.title,
                  body: @notification.message
              }
          }
          response = fcm.send(device_ids, options)

          puts response
        end
        respond_to do |format|
          format.html { redirect_to session.delete(:return_to), notice: "Notification was sent successfully to All from standard #{@standard.name}." }
          format.json { render :show, status: :created, location: @notification }
        end
    elsif notification_params[:notification_type] === 'to_all'
      device_ids = []
      Student.all.each do |student|
        @notification = Notification.new(title: notification_params[:title],
                                         message: notification_params[:message],
                                         from: notification_params[:from], student_id: student.id)

        @user = User.where(username: student.father_mobile).last
        unless device_ids.include?(@user.device_id)
          device_ids << @user.device_id
        end

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

      if notification_params[:by_app] == '1'

        puts device_ids
        require 'fcm'
        fcm = FCM.new(ENV['FCM_SERVER_KEY'])
        # fcm = init_fcm
        # @student = Student.find(notification_params[:student_id])
        # @user = User.where(username: @student.father_mobile).last
        # device_id = @user.device_id
        # registration_ids= [device_id] # an array of one or more client registration tokens
        options = {
            priority: "high",
            collapse_key: "updated_score",
            notification: {
                title: @notification.title,
                body: @notification.message
            }
        }
        response = fcm.send(device_ids, options)

        puts response
      end

      respond_to do |format|
        format.html { redirect_to session.delete(:return_to), notice: "Notification was sent successfully to All." }
        format.json { render :show, status: :created, location: @notification }
      end
    elsif notification_params[:notification_type] === 'student_wise'
      @notification = Notification.new(notification_params)

      @notification.save
      if notification_params[:by_mail] == '1'
        unless @notification.student.student_email.blank?
          NotificationMailer.notify_student(@notification.student, @notification).deliver
        end
      end
      if notification_params[:by_sms] == '1'
        send_sms_to_parent(@notification.student, @notification)
      end
      if notification_params[:by_app] == '1'
        require 'fcm'
        fcm = FCM.new(ENV['FCM_SERVER_KEY'])
        # fcm = init_fcm
        @student = Student.find(notification_params[:student_id])
        @user = User.where(username: @student.father_mobile).last
        device_id = @user.device_id
        registration_ids= [device_id] # an array of one or more client registration tokens
        options = {
            priority: "high",
            collapse_key: "updated_score",
            notification: {
                title: @notification.title,
                body: @notification.message,
                icon: "http://myschoolcon.com/images/schoolcon_logo.jpeg"
            }
        }
        response = fcm.send(registration_ids, options)

        puts response
      end
      respond_to do |format|
        format.html { redirect_to session.delete(:return_to), notice: "Notification was sent successfully." }
        format.json { render :show, status: :created, location: @notification }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:title, :message, :from, :student_id, :notification_type, :type_data, :by_sms, :by_mail, :by_app)
    end
end
