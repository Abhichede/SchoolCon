require 'test_helper'

class SchoolInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_info = school_infos(:one)
  end

  test "should get index" do
    get school_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_school_info_url
    assert_response :success
  end

  test "should create school_info" do
    assert_difference('SchoolInfo.count') do
      post school_infos_url, params: { school_info: { address: @school_info.address, code: @school_info.code, contact: @school_info.contact, email: @school_info.email, gst_no: @school_info.gst_no, logo: @school_info.logo, name: @school_info.name, registration_no: @school_info.registration_no } }
    end

    assert_redirected_to school_info_url(SchoolInfo.last)
  end

  test "should show school_info" do
    get school_info_url(@school_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_info_url(@school_info)
    assert_response :success
  end

  test "should update school_info" do
    patch school_info_url(@school_info), params: { school_info: { address: @school_info.address, code: @school_info.code, contact: @school_info.contact, email: @school_info.email, gst_no: @school_info.gst_no, logo: @school_info.logo, name: @school_info.name, registration_no: @school_info.registration_no } }
    assert_redirected_to school_info_url(@school_info)
  end

  test "should destroy school_info" do
    assert_difference('SchoolInfo.count', -1) do
      delete school_info_url(@school_info)
    end

    assert_redirected_to school_infos_url
  end
end
