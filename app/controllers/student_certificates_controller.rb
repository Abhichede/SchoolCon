class StudentCertificatesController < ApplicationController
  before_action :set_student_certificate, only: [:show, :edit, :update, :destroy]

  # GET /student_certificates
  # GET /student_certificates.json
  def index
    @student_certificates = StudentCertificate.all
  end

  # GET /student_certificates/1
  # GET /student_certificates/1.json
  def show
  end

  # GET /student_certificates/new
  def new
    @student_certificate = StudentCertificate.new
  end

  # GET /student_certificates/1/edit
  def edit
  end

  # POST /student_certificates
  # POST /student_certificates.json
  def create
    @student_certificate = StudentCertificate.new(student_certificate_params)

    respond_to do |format|
      if @student_certificate.save
        format.html { redirect_to student_path(@student_certificate.student), notice: 'Student certificate was successfully created.' }
        format.json { render :show, status: :created, location: @student_certificate }
      else
        format.html { redirect_to student_path(@student_certificate.student), alert: 'Some errors occured while saving Student Document. That might be invalid file type.' }
        format.json { render json: @student_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_certificates/1
  # PATCH/PUT /student_certificates/1.json
  def update
    respond_to do |format|
      if @student_certificate.update(student_certificate_params)
        format.html { redirect_to student_path(@student_certificate.student), notice: 'Student certificate was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_certificate }
      else
        format.html { render :edit }
        format.json { render json: @student_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_certificates/1
  # DELETE /student_certificates/1.json
  def destroy
    @student_certificate.destroy
    respond_to do |format|
      format.html { redirect_to student_path(@student_certificate.student), notice: 'Student certificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_certificate
      @student_certificate = StudentCertificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_certificate_params
      params.require(:student_certificate).permit(:student_id, :name, :path)
    end
end
