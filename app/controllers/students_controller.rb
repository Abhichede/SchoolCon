class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy add_leaving_certificate view_student_certificates]

  load_and_authorize_resource

  add_breadcrumb 'Students', :students_path

  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    if params[:search_query].presence
      @students = Student.search_by_full_name(params[:search_query])
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show; end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit; end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        update_student_wise_fee(@student)

        unless @student.is_enquiry
          update_parent(@student, true)
          @parent = Parent.find_by_mobile(@student.father_mobile)
          @student.update(prn: "#{SchoolInfo.first.code.blank? ? "PRN" : SchoolInfo.first.code}#{@student.id}")
        end

        if @student.is_enquiry
          admission_message = MyTemplate.find_by_name('Enquiry Success').desc
          admission_message.gsub! '#{father_name}', @student.father_full_name
          admission_message.gsub! '#{institute_name}', current_institute.name
          send_sms_to_parent(@student, Notification.new(message: ActionController::Base.helpers.strip_tags(admission_message)))
        end

        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      unless @student.student_wise_fees.nil?
        StudentWiseFee.where(student_id: @student.id,
                             academic_year_id: @student.academic_years.where(is_active: true).first.id).each(&:destroy)
      end
      if @student.update(student_params)
        update_student_wise_fee(@student)
        unless @student.is_enquiry
          update_parent(@student, false)
        end
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_divisions_students
    @standard = Standard.find(params[:standard_id])
    @divisions = @standard.divisions
    @filtered_divisions = true

    @student = Student.find(params[:id]) unless params[:id].blank?
  end

  def get_fee_structures
    if params[:standard_id]
      @standard = Standard.find(params[:standard_id])
      @fee_structures = @standard.fee_categories
    end

    @student = Student.find(params[:id]) unless params[:id].blank?
  end

  def update_student_wise_fee(student)
    @student = student
    @student.fee_categories.each do |fee|
      @student_wise = StudentWiseFee.new(student_id: @student.id, fee_category: fee.name,
                                         amount: fee.amount, academic_year_id: @student.academic_years.where(is_active: true).first.id,
                                         is_paid: false)
      @student_wise.save
    end
  end

  def update_parent(student, is_new)
    unless Parent.find_by_mobile(student.father_mobile)
      @parent = Parent.new(name: "#{student.father_first_name} #{student.father_middle_name} #{student.father_last_name}",
                           mobile: student.father_mobile)
      @parent.save

      @user = User.new(username: @parent.mobile, email: student.student_email, password: "#{@parent.mobile}", password_confirmation: "#{@parent.mobile}", student_id: @parent.id, roles_mask: 4, confirmed_at: Time.now, approved: true)
      @user.save
    end

    @parent = Parent.find_by_mobile(student.father_mobile)
    @user = User.where(username: @parent.mobile).last
    @user.update(student_id: @parent.id) unless @user.nil?
    student.update(parent_id: @parent.id)

    admission_message = MyTemplate.find_by_name('Admission Success').desc
    admission_message.gsub! '#{student_name}', student.self_full_name
    admission_message.gsub! '#{institute_name}', current_institute.name
    send_sms_to_parent(student, Notification.new(message: ActionController::Base.helpers.strip_tags(admission_message))) if is_new
  end

  def update_parent_from_view
    if params[:student_id]
      @student = Student.find(params[:student_id])
      update_parent(@student, true)
    end

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Parent added.' }
      format.json { head :no_content }
    end
  end

  def get_sibling_info
    @sibling = Student.find(params[:sibling_id]) unless params[:sibling_id].blank?
  end

  def add_leaving_certificate
    @student_certificate = StudentCertificate.new
  end

  def print_students_list
    if params[:type] === 'standard_wise'
      @standard = Standard.find(params[:id])
      @students = @standard.students.where(is_enquiry: false)

    elsif params[:type] === 'division_wise'
      @division = Division.find(params[:id])
      @students = @division.students.where(is_enquiry: false)
    end
    respond_to do |format|
      format.pdf do
        render pdf: "students", encoding: 'UTF-8'   # Excluding ".pdf" extension.
      end
    end
  end

  def view_student_certificates
    @bonafide_template = MyTemplate.find_by_name(params[:type])

    respond_to do |format|
      format.pdf do
        render pdf: "#{@student.self_full_name}_#{params[:type]}", encoding: 'UTF-8'   # Excluding ".pdf" extension.
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:first_name, :middle_name, :last_name, :date_of_birth, :birth_place,
                                    :gender, :student_mobile, :blood_group, :nationality, :mother_tongue,
                                    :caste_category_id, :caste_id, :religion_id, :father_first_name, :father_middle_name,
                                    :father_last_name, :mother_first_name, :mother_middle_name,
                                    :mother_last_name, :residential_address_one, :residential_address_two,
                                    :residential_city, :residential_state, :residential_country,
                                    :residential_pincode, :permanent_address_one, :permanent_address_two,
                                    :permanent_city, :permanent_state, :permanent_country, :permanent_pincode,
                                    :father_mobile, :mother_mobile, :father_occupation, :mother_occupation,
                                    :father_email, :mother_email, :student_email, :standard_ids, :prn,
                                    :last_school_attended, :academic_year_ids,
                                    :division_ids, :joining_date, :roll_no, :student_adhar, :father_adhar,
                                    :prev_standard, :prev_year, :prev_marks,
                                    :mother_adhar, :profile_photo, :is_enquiry, :medical_history, :skill_of_child,
                                    :siblings_schooling_details, :is_transportation_required, :transport_pickup_point,
                                    :disability_of_student, fee_category_ids: [])
  end
end
