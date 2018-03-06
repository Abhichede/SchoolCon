require 'test_helper'

class StudentCertificatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_certificate = student_certificates(:one)
  end

  test "should get index" do
    get student_certificates_url
    assert_response :success
  end

  test "should get new" do
    get new_student_certificate_url
    assert_response :success
  end

  test "should create student_certificate" do
    assert_difference('StudentCertificate.count') do
      post student_certificates_url, params: { student_certificate: { name: @student_certificate.name, path: @student_certificate.path, student_id: @student_certificate.student_id } }
    end

    assert_redirected_to student_certificate_url(StudentCertificate.last)
  end

  test "should show student_certificate" do
    get student_certificate_url(@student_certificate)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_certificate_url(@student_certificate)
    assert_response :success
  end

  test "should update student_certificate" do
    patch student_certificate_url(@student_certificate), params: { student_certificate: { name: @student_certificate.name, path: @student_certificate.path, student_id: @student_certificate.student_id } }
    assert_redirected_to student_certificate_url(@student_certificate)
  end

  test "should destroy student_certificate" do
    assert_difference('StudentCertificate.count', -1) do
      delete student_certificate_url(@student_certificate)
    end

    assert_redirected_to student_certificates_url
  end
end
