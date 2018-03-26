class StudentFeePaymentsController < ApplicationController
  before_action :set_student_fee_payment, only: [:show, :edit, :update, :destroy, :fee_receipt]

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
  end

  # POST /student_fee_payments
  # POST /student_fee_payments.json
  def create
    @student_fee_payment = StudentFeePayment.new(student_fee_payment_params)

    respond_to do |format|
      if @student_fee_payment.save
        format.html { redirect_to controller: 'student_fee_payments', action: 'fee_receipt', id: @student_fee_payment.id,student_id: @student_fee_payment.student.id, fee_type: 'student_wise', notice: 'Student fee payment was successfully created.' }
        format.json { render :show, status: :created, location: @student_fee_payment }
      else
        format.html { render :new }
        format.json { render json: @student_fee_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_fee_payments/1
  # PATCH/PUT /student_fee_payments/1.json
  def update
    respond_to do |format|
      if @student_fee_payment.update(student_fee_payment_params)
        format.html { redirect_to @student_fee_payment, notice: 'Student fee payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_fee_payment }
      else
        format.html { render :edit }
        format.json { render json: @student_fee_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_fee_payments/1
  # DELETE /student_fee_payments/1.json
  def destroy
    @student_fee_payment.destroy
    respond_to do |format|
      format.html { redirect_to student_fee_payments_url, notice: 'Student fee payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fee_payment

  end

  def fee_receipt
    session.delete(:return_to)
    session[:return_to] ||= request.referer


    if !params[:student_id].blank?
      @receipt_template = MyTemplate.find_by_name('Fee Receipt')
      @student = Student.find(params[:student_id])
    else
      respond_to do |format|
        format.html { redirect_to session.delete(:return_to), alert: 'Student student not found.' }
        format.json { head :no_content }
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
