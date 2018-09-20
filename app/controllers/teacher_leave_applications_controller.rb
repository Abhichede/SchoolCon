class TeacherLeaveApplicationsController < ApplicationController
  before_action :set_teacher_leave_application, only: [:show, :edit, :update, :destroy]

  # GET /teacher_leave_applications
  # GET /teacher_leave_applications.json
  def index
    @teacher_leave_applications = TeacherLeaveApplication.all
  end

  # GET /teacher_leave_applications/1
  # GET /teacher_leave_applications/1.json
  def show
  end

  # GET /teacher_leave_applications/new
  def new
    @teacher_leave_application = TeacherLeaveApplication.new
  end

  # GET /teacher_leave_applications/1/edit
  def edit
  end

  # POST /teacher_leave_applications
  # POST /teacher_leave_applications.json
  def create
    @teacher_leave_application = TeacherLeaveApplication.new(teacher_leave_application_params)

    respond_to do |format|
      if @teacher_leave_application.save
        format.html { redirect_to @teacher_leave_application, notice: 'Teacher leave application was successfully created.' }
        format.json { render :show, status: :created, location: @teacher_leave_application }
      else
        format.html { render :new }
        format.json { render json: @teacher_leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_leave_applications/1
  # PATCH/PUT /teacher_leave_applications/1.json
  def update
    respond_to do |format|
      if @teacher_leave_application.update(teacher_leave_application_params)
        format.html { redirect_to @teacher_leave_application, notice: 'Teacher leave application was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_leave_application }
      else
        format.html { render :edit }
        format.json { render json: @teacher_leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_leave_applications/1
  # DELETE /teacher_leave_applications/1.json
  def destroy
    @teacher_leave_application.destroy
    respond_to do |format|
      format.html { redirect_to teacher_leave_applications_url, notice: 'Teacher leave application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_leave_application
      @teacher_leave_application = TeacherLeaveApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_leave_application_params
      params.require(:teacher_leave_application).permit(:teacher_id, :subject, :message, :is_approved)
    end
end
