require 'test_helper'

class StudentWiseDiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_wise_discount = student_wise_discounts(:one)
  end

  test "should get index" do
    get student_wise_discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_student_wise_discount_url
    assert_response :success
  end

  test "should create student_wise_discount" do
    assert_difference('StudentWiseDiscount.count') do
      post student_wise_discounts_url, params: { student_wise_discount: { academic_year_id: @student_wise_discount.academic_year_id, amount: @student_wise_discount.amount, description: @student_wise_discount.description, is_payment_done: @student_wise_discount.is_payment_done, student_id: @student_wise_discount.student_id } }
    end

    assert_redirected_to student_wise_discount_url(StudentWiseDiscount.last)
  end

  test "should show student_wise_discount" do
    get student_wise_discount_url(@student_wise_discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_wise_discount_url(@student_wise_discount)
    assert_response :success
  end

  test "should update student_wise_discount" do
    patch student_wise_discount_url(@student_wise_discount), params: { student_wise_discount: { academic_year_id: @student_wise_discount.academic_year_id, amount: @student_wise_discount.amount, description: @student_wise_discount.description, is_payment_done: @student_wise_discount.is_payment_done, student_id: @student_wise_discount.student_id } }
    assert_redirected_to student_wise_discount_url(@student_wise_discount)
  end

  test "should destroy student_wise_discount" do
    assert_difference('StudentWiseDiscount.count', -1) do
      delete student_wise_discount_url(@student_wise_discount)
    end

    assert_redirected_to student_wise_discounts_url
  end
end
