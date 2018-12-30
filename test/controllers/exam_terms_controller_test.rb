require 'test_helper'

class ExamTermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_term = exam_terms(:one)
  end

  test "should get index" do
    get exam_terms_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_term_url
    assert_response :success
  end

  test "should create exam_term" do
    assert_difference('ExamTerm.count') do
      post exam_terms_url, params: { exam_term: { end_date: @exam_term.end_date, start_date: @exam_term.start_date, term_name: @exam_term.term_name } }
    end

    assert_redirected_to exam_term_url(ExamTerm.last)
  end

  test "should show exam_term" do
    get exam_term_url(@exam_term)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_term_url(@exam_term)
    assert_response :success
  end

  test "should update exam_term" do
    patch exam_term_url(@exam_term), params: { exam_term: { end_date: @exam_term.end_date, start_date: @exam_term.start_date, term_name: @exam_term.term_name } }
    assert_redirected_to exam_term_url(@exam_term)
  end

  test "should destroy exam_term" do
    assert_difference('ExamTerm.count', -1) do
      delete exam_term_url(@exam_term)
    end

    assert_redirected_to exam_terms_url
  end
end
