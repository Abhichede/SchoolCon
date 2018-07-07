require 'test_helper'

class LeaveApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_application = leave_applications(:one)
  end

  test "should get index" do
    get leave_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_application_url
    assert_response :success
  end

  test "should create leave_application" do
    assert_difference('LeaveApplication.count') do
      post leave_applications_url, params: { leave_application: { is_approved: @leave_application.is_approved, message: @leave_application.message, seen_date: @leave_application.seen_date, student_id: @leave_application.student_id, subject: @leave_application.subject, teacher_id: @leave_application.teacher_id } }
    end

    assert_redirected_to leave_application_url(LeaveApplication.last)
  end

  test "should show leave_application" do
    get leave_application_url(@leave_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_application_url(@leave_application)
    assert_response :success
  end

  test "should update leave_application" do
    patch leave_application_url(@leave_application), params: { leave_application: { is_approved: @leave_application.is_approved, message: @leave_application.message, seen_date: @leave_application.seen_date, student_id: @leave_application.student_id, subject: @leave_application.subject, teacher_id: @leave_application.teacher_id } }
    assert_redirected_to leave_application_url(@leave_application)
  end

  test "should destroy leave_application" do
    assert_difference('LeaveApplication.count', -1) do
      delete leave_application_url(@leave_application)
    end

    assert_redirected_to leave_applications_url
  end
end
