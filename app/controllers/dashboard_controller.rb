class DashboardController < ApplicationController
  def index
    @students = Student.where(is_enquiry: false)
    @teachers = Teacher.where(staff_type: 'Teaching')
    @standards = Standard.all
    @student_fee = StudentFeePayment.all
    @posts = Post.all.order("created_at DESC").limit(10)
  end
end
