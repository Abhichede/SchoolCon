class DashboardController < ApplicationController
  def index
    @students = Student.where(is_enquiry: false)
    @teachers = Teacher.where(staff_type: 'teaching')
    @standards = Standard.all
    @student_fee = StudentFeePayment.all
  end
end
