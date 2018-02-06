class DashboardController < ApplicationController
  def index
    @students = Student.all
    @teachers = Teacher.where(staff_type: 'teaching')
    @standards = Standard.all
    @student_fee = StudentFeePayment.all
  end
end
