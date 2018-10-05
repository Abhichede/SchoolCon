class StudentFeePaymentsController < ApplicationController
  before_action :set_student_fee_payment, only: [:show, :edit, :update, :destroy, :fee_receipt]
  load_and_authorize_resource

  add_breadcrumb 'Fee Payment', :student_fee_payments_path
  # GET /student_fee_payments
  # GET /student_fee_payments.json
  def index
    @student_fee_payments = StudentFeePayment.all
  end

  # GET /student_fee_payments/1
  # GET /student_fee_payments/1.json
  def show
  end

  # GET /student_fee_payments/new
  def new
    @student_fee_payment = StudentFeePayment.new
    if !params[:student_id].nil? || !params[:student_id].blank?
      @student = Student.find(params[:student_id])
    end

    @student_wise_discount = StudentWiseDiscount.new
    @student_wise_fine = StudentWiseFine.new
    @student_wise_instant_fee = StudentWiseInstantFee.new
  end

  # GET /student_fee_payments/1/edit
  def edit
    if !params[:student_id].nil? || !params[:student_id].blank?
      @student = Student.find(params[:student_id])
    end

    @student_wise_discount = StudentWiseDiscount.new
    @student_wise_fine = StudentWiseFine.new
    @student_wise_instant_fee = StudentWiseInstantFee.new
  end

  # POST /student_fee_payments
  # POST /student_fee_payments.json
  def create
    @student_fee_payment = StudentFeePayment.new(student_fee_payment_params)
    @student = Student.find(student_fee_payment_params[:student_id])
    if @student.current_balance_amount >= student_fee_payment_params[:amount].to_f
      respond_to do |format|
        if @student_fee_payment.save
          admission_message = MyTemplate.find_by_name('Fee Payment Message').desc
          admission_message.gsub! '#{amount}', @student_fee_payment.amount.to_s
          admission_message.gsub! '#{institute_name}', current_institute.name
          send_sms_to_parent(@student, Notification.new(message: ActionController::Base.helpers.strip_tags(admission_message)))

          require 'fcm'
          fcm = FCM.new(ENV['FCM_SERVER_KEY'])
          # fcm = init_fcm
          @user = User.where(username: @student.father_mobile).last
          device_id = @user.device_id
          registration_ids= [device_id] # an array of one or more client registration tokens
          options = {
              priority: "high",
              collapse_key: "updated_score",
              notification: {
                  title: "Fee Payments",
                  body: ActionController::Base.helpers.strip_tags(admission_message)
              }
          }
          response = fcm.send(registration_ids, options)

          puts response

          format.html { redirect_to fee_receipt_path(id: @student_fee_payment.id, student_id: @student_fee_payment.student.id, fee_type: 'student_wise'), notice: 'Student fee payment was successfully created.' }
          format.json { render :show, status: :created, location: @student_fee_payment }
        else
          format.html { render :new }
          format.json { render json: @student_fee_payment.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to student_path(id: @student.id),  alert: 'Fee is greater than balance amount.' }
      end
    end
  end

  # PATCH/PUT /student_fee_payments/1
  # PATCH/PUT /student_fee_payments/1.json
  def update
    @student = Student.find(student_fee_payment_params[:student_id])
    if (@student.current_balance_amount + @student_fee_payment.amount.to_f) >= student_fee_payment_params[:amount].to_f
      respond_to do |format|
        if @student_fee_payment.update(student_fee_payment_params)
          format.html { redirect_to fee_receipt_path(id: @student_fee_payment.id, student_id: @student_fee_payment.student.id, fee_type: 'student_wise'), notice: 'Student fee payment was successfully updated.' }
          format.json { render :show, status: :ok, location: @student_fee_payment }
        else
          format.html { render :edit }
          format.json { render json: @student_fee_payment.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to student_path(id: @student.id),  alert: 'Fee is greater than balance amount.' }
      end
    end
  end

  # DELETE /student_fee_payments/1
  # DELETE /student_fee_payments/1.json
  def destroy
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    @student_fee_payment.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: 'Student fee payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fee_payment

  end

  def fee_receipt
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if !params[:student_id].blank?
        @receipt_template = MyTemplate.find_by_name('Fee Receipt')
        @student = Student.find(params[:student_id])
        format.html
        format.pdf do
          render pdf: "file_name"   # Excluding ".pdf" extension.
        end
      else
        format.html { redirect_to session.delete(:return_to), alert: 'Student student not found.' }
        format.json { head :no_content }
      end
    end
  end

  def fee_statement
    @student = Student.find(params[:student_id]) unless params[:student_id].blank?

    respond_to do |format|
      format.pdf do
        render pdf: "students_statement"   # Excluding ".pdf" extension.
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_fee_payment
      @student_fee_payment = StudentFeePayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_fee_payment_params
      params.require(:student_fee_payment).permit(:student_id, :academic_year_id, :payment_date, :payment_mode, :payment_desc, :amount)
    end
end
