require 'test_helper'

class MyTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_template = my_templates(:one)
  end

  test "should get index" do
    get my_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_my_template_url
    assert_response :success
  end

  test "should create my_template" do
    assert_difference('MyTemplate.count') do
      post my_templates_url, params: { my_template: { desc: @my_template.desc, name: @my_template.name } }
    end

    assert_redirected_to my_template_url(MyTemplate.last)
  end

  test "should show my_template" do
    get my_template_url(@my_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_template_url(@my_template)
    assert_response :success
  end

  test "should update my_template" do
    patch my_template_url(@my_template), params: { my_template: { desc: @my_template.desc, name: @my_template.name } }
    assert_redirected_to my_template_url(@my_template)
  end

  test "should destroy my_template" do
    assert_difference('MyTemplate.count', -1) do
      delete my_template_url(@my_template)
    end

    assert_redirected_to my_templates_url
  end
end
