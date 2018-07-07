require 'test_helper'

class ParentMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parent_message = parent_messages(:one)
  end

  test "should get index" do
    get parent_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_parent_message_url
    assert_response :success
  end

  test "should create parent_message" do
    assert_difference('ParentMessage.count') do
      post parent_messages_url, params: { parent_message: { message: @parent_message.message, student_id: @parent_message.student_id, teacher_id: @parent_message.teacher_id } }
    end

    assert_redirected_to parent_message_url(ParentMessage.last)
  end

  test "should show parent_message" do
    get parent_message_url(@parent_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_parent_message_url(@parent_message)
    assert_response :success
  end

  test "should update parent_message" do
    patch parent_message_url(@parent_message), params: { parent_message: { message: @parent_message.message, student_id: @parent_message.student_id, teacher_id: @parent_message.teacher_id } }
    assert_redirected_to parent_message_url(@parent_message)
  end

  test "should destroy parent_message" do
    assert_difference('ParentMessage.count', -1) do
      delete parent_message_url(@parent_message)
    end

    assert_redirected_to parent_messages_url
  end
end
