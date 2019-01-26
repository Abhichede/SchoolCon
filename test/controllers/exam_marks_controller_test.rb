require 'test_helper'

class ExamMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_mark = exam_marks(:one)
  end

  test "should get index" do
    get exam_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_mark_url
    assert_response :success
  end

  test "should create exam_mark" do
    assert_difference('ExamMark.count') do
      post exam_marks_url, params: { exam_mark: { assessment_marks: @exam_mark.assessment_marks, exam_id: @exam_mark.exam_id, exam_subject_id: @exam_mark.exam_subject_id, student_id: @exam_mark.student_id, written_marks: @exam_mark.written_marks } }
    end

    assert_redirected_to exam_mark_url(ExamMark.last)
  end

  test "should show exam_mark" do
    get exam_mark_url(@exam_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_mark_url(@exam_mark)
    assert_response :success
  end

  test "should update exam_mark" do
    patch exam_mark_url(@exam_mark), params: { exam_mark: { assessment_marks: @exam_mark.assessment_marks, exam_id: @exam_mark.exam_id, exam_subject_id: @exam_mark.exam_subject_id, student_id: @exam_mark.student_id, written_marks: @exam_mark.written_marks } }
    assert_redirected_to exam_mark_url(@exam_mark)
  end

  test "should destroy exam_mark" do
    assert_difference('ExamMark.count', -1) do
      delete exam_mark_url(@exam_mark)
    end

    assert_redirected_to exam_marks_url
  end
end
