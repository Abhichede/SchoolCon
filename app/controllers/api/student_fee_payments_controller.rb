module Api
  class StudentFeePaymentsController < Api::ApiController
    before_action :set_student_fee_payment, only: %i[show]

    def index
      if params[:student_id]
        @student = Student.find(params[:student_id]) if params[:student_id]
        @student_fee_payments = @student.student_fee_payments if params[:student_id]
      else
        @student_fee_payments = StudentFeePayment.all.order("payment_date DESC")
      end
    end


    def show; end

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


            format.json { render json: { success: 'Success' }}
          else
            format.json { render json: @student_fee_payment.errors, status: :unprocessable_entity }
          end
        end

      else
        respond_to do |format|
          format.json { render json: {error: 'Fee is greater than balance amount.' }}
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
end