require 'test_helper'

class QuestionPapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_paper = question_papers(:one)
  end

  test "should get index" do
    get question_papers_url
    assert_response :success
  end

  test "should get new" do
    get new_question_paper_url
    assert_response :success
  end

  test "should create question_paper" do
    assert_difference('QuestionPaper.count') do
      post question_papers_url, params: { question_paper: { name: @question_paper.name, subject_id: @question_paper.subject_id } }
    end

    assert_redirected_to question_paper_url(QuestionPaper.last)
  end

  test "should show question_paper" do
    get question_paper_url(@question_paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_paper_url(@question_paper)
    assert_response :success
  end

  test "should update question_paper" do
    patch question_paper_url(@question_paper), params: { question_paper: { name: @question_paper.name, subject_id: @question_paper.subject_id } }
    assert_redirected_to question_paper_url(@question_paper)
  end

  test "should destroy question_paper" do
    assert_difference('QuestionPaper.count', -1) do
      delete question_paper_url(@question_paper)
    end

    assert_redirected_to question_papers_url
  end
end
