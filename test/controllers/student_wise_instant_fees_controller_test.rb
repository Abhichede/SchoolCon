require 'test_helper'

class StudentWiseInstantFeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_wise_instant_fee = student_wise_instant_fees(:one)
  end

  test "should get index" do
    get student_wise_instant_fees_url
    assert_response :success
  end

  test "should get new" do
    get new_student_wise_instant_fee_url
    assert_response :success
  end

  test "should create student_wise_instant_fee" do
    assert_difference('StudentWiseInstantFee.count') do
      post student_wise_instant_fees_url, params: { student_wise_instant_fee: { academic_year_id: @student_wise_instant_fee.academic_year_id, amount: @student_wise_instant_fee.amount, description: @student_wise_instant_fee.description, student_id: @student_wise_instant_fee.student_id } }
    end

    assert_redirected_to student_wise_instant_fee_url(StudentWiseInstantFee.last)
  end

  test "should show student_wise_instant_fee" do
    get student_wise_instant_fee_url(@student_wise_instant_fee)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_wise_instant_fee_url(@student_wise_instant_fee)
    assert_response :success
  end

  test "should update student_wise_instant_fee" do
    patch student_wise_instant_fee_url(@student_wise_instant_fee), params: { student_wise_instant_fee: { academic_year_id: @student_wise_instant_fee.academic_year_id, amount: @student_wise_instant_fee.amount, description: @student_wise_instant_fee.description, student_id: @student_wise_instant_fee.student_id } }
    assert_redirected_to student_wise_instant_fee_url(@student_wise_instant_fee)
  end

  test "should destroy student_wise_instant_fee" do
    assert_difference('StudentWiseInstantFee.count', -1) do
      delete student_wise_instant_fee_url(@student_wise_instant_fee)
    end

    assert_redirected_to student_wise_instant_fees_url
  end
end
