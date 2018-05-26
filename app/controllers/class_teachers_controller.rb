class ClassTeachersController < ApplicationController
  before_action :set_class_teacher, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /class_teachers
  # GET /class_teachers.json
  def index
    @class_teachers = ClassTeacher.all
  end

  # GET /class_teachers/1
  # GET /class_teachers/1.json
  def show
  end

  # GET /class_teachers/new
  def new
    @class_teacher = ClassTeacher.new
  end

  # GET /class_teachers/1/edit
  def edit
  end

  # POST /class_teachers
  # POST /class_teachers.json
  def create
    @class_teacher = ClassTeacher.new(class_teacher_params)
    @already_assigned = Division.find(class_teacher_params[:division_id]).class_teacher
    respond_to do |format|
      if @already_assigned.nil?
        if @class_teacher.save
          format.html { redirect_to class_teachers_path, notice: 'Class teacher was successfully created.' }
          format.json { render :show, status: :created, location: @class_teacher }
        else
          format.html { render :new }
          format.json { render json: @class_teacher.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to class_teachers_path, alert: 'Class teacher was assigned already for this division or class.' }
        format.json { render :show, status: :created, location: @class_teacher }
      end
    end
  end

  # PATCH/PUT /class_teachers/1
  # PATCH/PUT /class_teachers/1.json
  def update
    respond_to do |format|
      if @class_teacher.update(class_teacher_params)
        format.html { redirect_to class_teachers_path, notice: 'Class teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_teacher }
      else
        format.html { render :edit }
        format.json { render json: @class_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_teachers/1
  # DELETE /class_teachers/1.json
  def destroy
    @class_teacher.destroy
    respond_to do |format|
      format.html { redirect_to class_teachers_url, notice: 'Class teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_teacher
      @class_teacher = ClassTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_teacher_params
      params.require(:class_teacher).permit(:division_id, :teacher_id, :standard_id)
    end
end
