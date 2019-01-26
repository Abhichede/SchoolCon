require 'test_helper'

class StudentMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_mark = student_marks(:one)
  end

  test "should get index" do
    get student_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_student_mark_url
    assert_response :success
  end

  test "should create student_mark" do
    assert_difference('StudentMark.count') do
      post student_marks_url, params: { student_mark: { exam_id: @student_mark.exam_id, marks: @student_mark.marks, student_id: @student_mark.student_id, subject_id: @student_mark.subject_id } }
    end

    assert_redirected_to student_mark_url(StudentMark.last)
  end

  test "should show student_mark" do
    get student_mark_url(@student_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_mark_url(@student_mark)
    assert_response :success
  end

  test "should update student_mark" do
    patch student_mark_url(@student_mark), params: { student_mark: { exam_id: @student_mark.exam_id, marks: @student_mark.marks, student_id: @student_mark.student_id, subject_id: @student_mark.subject_id } }
    assert_redirected_to student_mark_url(@student_mark)
  end

  test "should destroy student_mark" do
    assert_difference('StudentMark.count', -1) do
      delete student_mark_url(@student_mark)
    end

    assert_redirected_to student_marks_url
  end
end
