require 'test_helper'

class TeacherLeaveApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_leave_application = teacher_leave_applications(:one)
  end

  test "should get index" do
    get teacher_leave_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_leave_application_url
    assert_response :success
  end

  test "should create teacher_leave_application" do
    assert_difference('TeacherLeaveApplication.count') do
      post teacher_leave_applications_url, params: { teacher_leave_application: { is_approved: @teacher_leave_application.is_approved, message: @teacher_leave_application.message, subject: @teacher_leave_application.subject, teacher_id: @teacher_leave_application.teacher_id } }
    end

    assert_redirected_to teacher_leave_application_url(TeacherLeaveApplication.last)
  end

  test "should show teacher_leave_application" do
    get teacher_leave_application_url(@teacher_leave_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_leave_application_url(@teacher_leave_application)
    assert_response :success
  end

  test "should update teacher_leave_application" do
    patch teacher_leave_application_url(@teacher_leave_application), params: { teacher_leave_application: { is_approved: @teacher_leave_application.is_approved, message: @teacher_leave_application.message, subject: @teacher_leave_application.subject, teacher_id: @teacher_leave_application.teacher_id } }
    assert_redirected_to teacher_leave_application_url(@teacher_leave_application)
  end

  test "should destroy teacher_leave_application" do
    assert_difference('TeacherLeaveApplication.count', -1) do
      delete teacher_leave_application_url(@teacher_leave_application)
    end

    assert_redirected_to teacher_leave_applications_url
  end
end
