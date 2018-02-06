require 'test_helper'

class StudentWiseFinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_wise_fine = student_wise_fines(:one)
  end

  test "should get index" do
    get student_wise_fines_url
    assert_response :success
  end

  test "should get new" do
    get new_student_wise_fine_url
    assert_response :success
  end

  test "should create student_wise_fine" do
    assert_difference('StudentWiseFine.count') do
      post student_wise_fines_url, params: { student_wise_fine: { academic_year_id: @student_wise_fine.academic_year_id, amount: @student_wise_fine.amount, desciption: @student_wise_fine.desciption, student_id: @student_wise_fine.student_id } }
    end

    assert_redirected_to student_wise_fine_url(StudentWiseFine.last)
  end

  test "should show student_wise_fine" do
    get student_wise_fine_url(@student_wise_fine)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_wise_fine_url(@student_wise_fine)
    assert_response :success
  end

  test "should update student_wise_fine" do
    patch student_wise_fine_url(@student_wise_fine), params: { student_wise_fine: { academic_year_id: @student_wise_fine.academic_year_id, amount: @student_wise_fine.amount, desciption: @student_wise_fine.desciption, student_id: @student_wise_fine.student_id } }
    assert_redirected_to student_wise_fine_url(@student_wise_fine)
  end

  test "should destroy student_wise_fine" do
    assert_difference('StudentWiseFine.count', -1) do
      delete student_wise_fine_url(@student_wise_fine)
    end

    assert_redirected_to student_wise_fines_url
  end
end
