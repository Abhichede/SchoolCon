class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_standards, only: [:new, :edit]
  before_action :set_subjects, only: [:new, :edit]
  load_and_authorize_resource
  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.where(:staff_type => 'Teaching')
  end

  def non_teaching
    @teachers = Teacher.where(:staff_type => 'Non-Teaching')
  end

  def admins
    @teachers = Teacher.where(:staff_type => 'Admin')
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/newf
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        if @user = User.find_by_email(@teacher.email)
          @user.update(student_id: @teacher.id)
        else
          User.create(email: @teacher.email, password: "#{@teacher.first_name}#{@teacher.contact}", password_confirmation: "#{@teacher.first_name}#{@teacher.contact}", student_id: @teacher.id, roles_mask: 2, username: @teacher.contact, confirmed_at: Time.now, approved: true)
        end
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @user = User.find_by_email(@teacher.email)
    @user.destroy unless @user.nil? && @user.roles == 'Teacher'
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
    def set_standards
      @standards = Standard.all
    end
    def set_subjects
      @subjects = Subject.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:first_name, :middle_name, :last_name, :address_one,
                                      :address_two, :city, :state, :country, :pincode,
                                      :contact, {:subject_ids => []}, :dob, :gender, :blood_group,
                                      :email, :staff_type)
    end
end
