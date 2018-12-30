require 'test_helper'

class TotalMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @total_mark = total_marks(:one)
  end

  test "should get index" do
    get total_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_total_mark_url
    assert_response :success
  end

  test "should create total_mark" do
    assert_difference('TotalMark.count') do
      post total_marks_url, params: { total_mark: { assessment_marks: @total_mark.assessment_marks, exam_id: @total_mark.exam_id, exam_term_id: @total_mark.exam_term_id, written_marks: @total_mark.written_marks } }
    end

    assert_redirected_to total_mark_url(TotalMark.last)
  end

  test "should show total_mark" do
    get total_mark_url(@total_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_total_mark_url(@total_mark)
    assert_response :success
  end

  test "should update total_mark" do
    patch total_mark_url(@total_mark), params: { total_mark: { assessment_marks: @total_mark.assessment_marks, exam_id: @total_mark.exam_id, exam_term_id: @total_mark.exam_term_id, written_marks: @total_mark.written_marks } }
    assert_redirected_to total_mark_url(@total_mark)
  end

  test "should destroy total_mark" do
    assert_difference('TotalMark.count', -1) do
      delete total_mark_url(@total_mark)
    end

    assert_redirected_to total_marks_url
  end
end
