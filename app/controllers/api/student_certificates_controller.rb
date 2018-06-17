module Api
  class StudentCertificatesController < Api::ApiController
    before_action :set_student_certificate, only: %i[show]

    def index
      if params[:student_id]
        @student = Student.find(params[:student_id])
        @student_certificates = @student.student_certificates
      else
        @student_certificates = StudentCertificate.all
      end
    end

    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_student_certificate
      @student_certificate = StudentCertificate.find(params[:id])
    end
  end
end