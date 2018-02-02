require 'test_helper'

class StudentFeePaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_fee_payment = student_fee_payments(:one)
  end

  test "should get index" do
    get student_fee_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_student_fee_payment_url
    assert_response :success
  end

  test "should create student_fee_payment" do
    assert_difference('StudentFeePayment.count') do
      post student_fee_payments_url, params: { student_fee_payment: { academic_year_id: @student_fee_payment.academic_year_id, amount: @student_fee_payment.amount, payment_date: @student_fee_payment.payment_date, payment_desc: @student_fee_payment.payment_desc, payment_mode: @student_fee_payment.payment_mode, student_id: @student_fee_payment.student_id } }
    end

    assert_redirected_to student_fee_payment_url(StudentFeePayment.last)
  end

  test "should show student_fee_payment" do
    get student_fee_payment_url(@student_fee_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_fee_payment_url(@student_fee_payment)
    assert_response :success
  end

  test "should update student_fee_payment" do
    patch student_fee_payment_url(@student_fee_payment), params: { student_fee_payment: { academic_year_id: @student_fee_payment.academic_year_id, amount: @student_fee_payment.amount, payment_date: @student_fee_payment.payment_date, payment_desc: @student_fee_payment.payment_desc, payment_mode: @student_fee_payment.payment_mode, student_id: @student_fee_payment.student_id } }
    assert_redirected_to student_fee_payment_url(@student_fee_payment)
  end

  test "should destroy student_fee_payment" do
    assert_difference('StudentFeePayment.count', -1) do
      delete student_fee_payment_url(@student_fee_payment)
    end

    assert_redirected_to student_fee_payments_url
  end
end
