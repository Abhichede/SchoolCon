class StudentWiseDiscountsController < ApplicationController
  before_action :set_student_wise_discount, only: [:show, :edit, :update, :destroy]

  # GET /student_wise_discounts
  # GET /student_wise_discounts.json
  def index
    @student_wise_discounts = StudentWiseDiscount.all
  end

  # GET /student_wise_discounts/1
  # GET /student_wise_discounts/1.json
  def show
  end

  # GET /student_wise_discounts/new
  def new
    @student_wise_discount = StudentWiseDiscount.new
  end

  # GET /student_wise_discounts/1/edit
  def edit
  end

  # POST /student_wise_discounts
  # POST /student_wise_discounts.json
  def create
    @student_wise_discount = StudentWiseDiscount.new(student_wise_discount_params)

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @student_wise_discount.save
        format.html { redirect_to session.delete(:return_to), notice: 'Student wise discount was successfully created.' }
        format.json { render :show, status: :created, location: @student_wise_discount }
      else
        format.html { render :new }
        format.json { render json: @student_wise_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_wise_discounts/1
  # PATCH/PUT /student_wise_discounts/1.json
  def update
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|

      if @student_wise_discount.update(student_wise_discount_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Student wise discount was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_wise_discount }
      else
        format.html { render :edit }
        format.json { render json: @student_wise_discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_wise_discounts/1
  # DELETE /student_wise_discounts/1.json
  def destroy
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    @student_wise_discount.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: 'Student wise discount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_wise_discount
      @student_wise_discount = StudentWiseDiscount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_wise_discount_params
      params.require(:student_wise_discount).permit(:student_id, :academic_year_id, :description, :amount, :is_payment_done)
    end
end
