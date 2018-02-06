class StudentWiseInstantFeesController < ApplicationController
  before_action :set_student_wise_instant_fee, only: [:show, :edit, :update, :destroy]

  # GET /student_wise_instant_fees
  # GET /student_wise_instant_fees.json
  def index
    @student_wise_instant_fees = StudentWiseInstantFee.all
  end

  # GET /student_wise_instant_fees/1
  # GET /student_wise_instant_fees/1.json
  def show
  end

  # GET /student_wise_instant_fees/new
  def new
    @student_wise_instant_fee = StudentWiseInstantFee.new
  end

  # GET /student_wise_instant_fees/1/edit
  def edit
  end

  # POST /student_wise_instant_fees
  # POST /student_wise_instant_fees.json
  def create
    @student_wise_instant_fee = StudentWiseInstantFee.new(student_wise_instant_fee_params)

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @student_wise_instant_fee.save
        format.html { redirect_to session.delete(:return_to), notice: 'Student wise instant fee was successfully created.' }
        format.json { render :show, status: :created, location: @student_wise_instant_fee }
      else
        format.html { render :new }
        format.json { render json: @student_wise_instant_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_wise_instant_fees/1
  # PATCH/PUT /student_wise_instant_fees/1.json
  def update

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @student_wise_instant_fee.update(student_wise_instant_fee_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Student wise instant fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_wise_instant_fee }
      else
        format.html { render :edit }
        format.json { render json: @student_wise_instant_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_wise_instant_fees/1
  # DELETE /student_wise_instant_fees/1.json
  def destroy

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    @student_wise_instant_fee.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: 'Student wise instant fee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_wise_instant_fee
      @student_wise_instant_fee = StudentWiseInstantFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_wise_instant_fee_params
      params.require(:student_wise_instant_fee).permit(:student_id, :academic_year_id, :description, :amount)
    end
end
