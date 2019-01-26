require 'test_helper'

class ExamSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_subject = exam_subjects(:one)
  end

  test "should get index" do
    get exam_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_subject_url
    assert_response :success
  end

  test "should create exam_subject" do
    assert_difference('ExamSubject.count') do
      post exam_subjects_url, params: { exam_subject: { assessment_marks: @exam_subject.assessment_marks, exam_id: @exam_subject.exam_id, max_marks: @exam_subject.max_marks, pass_marks: @exam_subject.pass_marks, subject_id: @exam_subject.subject_id, written_marks: @exam_subject.written_marks } }
    end

    assert_redirected_to exam_subject_url(ExamSubject.last)
  end

  test "should show exam_subject" do
    get exam_subject_url(@exam_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_subject_url(@exam_subject)
    assert_response :success
  end

  test "should update exam_subject" do
    patch exam_subject_url(@exam_subject), params: { exam_subject: { assessment_marks: @exam_subject.assessment_marks, exam_id: @exam_subject.exam_id, max_marks: @exam_subject.max_marks, pass_marks: @exam_subject.pass_marks, subject_id: @exam_subject.subject_id, written_marks: @exam_subject.written_marks } }
    assert_redirected_to exam_subject_url(@exam_subject)
  end

  test "should destroy exam_subject" do
    assert_difference('ExamSubject.count', -1) do
      delete exam_subject_url(@exam_subject)
    end

    assert_redirected_to exam_subjects_url
  end
end
