module Api
  class StudentFeePaymentsController < Api::ApiController
    before_action :set_student_fee_payment, only: %i[show]

    def index
      if params[:student_id]
        @student = Student.find(params[:student_id]) if params[:student_id]
        @student_fee_payments = @student.student_fee_payments if params[:student_id]

      else
        @student_fee_payments = StudentFeePayment.all
      end
    end


    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_student_fee_payment
      @student_fee_payment = StudentFeePayment.find(params[:id])
    end
  end
end