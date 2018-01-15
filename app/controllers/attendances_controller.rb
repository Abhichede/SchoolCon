class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    if params[:standard_id] && params[:division] && params[:date] && params[:subject]
      @attendance = Attendance.where(:standard_id => params[:standard_id],
                                     :division_id => params[:division],
                                     :date => params[:date], :subject_id => params[:subject]).limit(1).last
      @standard = Standard.find(params[:standard_id])
      @division = Division.find(params[:division])
      @students = @division.students
    else
      @attendances = Attendance.all
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @att_data = @attendance.att_data
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to controller: 'attendances', action: 'index',
                                  standard_id: @attendance.standard_id, division: @attendance.division_id,
                                  subject: @attendance.subject_id, date: @attendance.date, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_students
    @standard = Standard.find(params[:standard_id])
    @division = @standard.divisions.find(params[:division_id])

    @students = @division.students
    if !params[:id].blank?
      @attendance = Attendance.find(params[:id])
    end
  end

  def get_divisions_attendance
    @standard = Standard.find(params[:standard_id])
    @divisions = @standard.divisions
    @filtered_divisions = true
    if !params[:id].blank?
      @attendance = Attendance.find(params[:id])
    end

  end

  def get_subjects_attendance
    @teacher = Teacher.find(params[:teacher_id])
    @subjects = @teacher.subjects
    @filtered_subjects = true

    if !params[:id].blank?
      @attendance = Attendance.find(params[:id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:date, :subject_id, :standard_id, :division_id, :teacher_id, :att_data => [].to_h)
    end
end
