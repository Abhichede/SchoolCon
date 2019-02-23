class ReportsController < ApplicationController
  def index
  end

  def student_report
    if params[:report_for] === 'gender'
      @standard = Standard.find(params[:standard_id])
      @students = @standard.students.where(gender: params[:gender])

      respond_to do |format|
        format.pdf do
          render pdf: "students", encoding: 'UTF-8'
        end
        format.html { }
        format.js { }
        format.xls
      end
    elsif params[:report_for] === 'blood_group'
      @standard = Standard.find(params[:standard_id])
      @students = @standard.students.where(blood_group: params[:blood_group])

       respond_to do |format|
         format.pdf do
           render pdf: "students", encoding: 'UTF-8'
         end
         format.html { }
         format.js { }
         format.xls
       end
    elsif params[:report_for] === 'category'
      @standard = Standard.find(params[:standard_id])
      @category = CasteCategory.find(params[:category])

      @students = @category.students.merge(@standard.students)

      respond_to do |format|
        format.pdf do
          render pdf: "students", encoding: 'UTF-8'
        end
        format.html { }
        format.js { }
        format.xls
      end
    elsif params[:report_for] === 'caste'
      @standard = Standard.find(params[:standard_id])
      @caste = Caste.find(params[:caste])

      @students = @caste.students.merge(@standard.students)

      respond_to do |format|
        format.pdf do
          render pdf: "students", encoding: 'UTF-8'
        end
        format.html { }
        format.js { }
        format.xls
      end
    elsif params[:report_for] === 'religion'
      @standard = Standard.find(params[:standard_id])
      @religion = Religion.find(params[:religion])

      @students = @religion.students.merge(@standard.students)

      respond_to do |format|
        format.pdf do
          render pdf: "students", encoding: 'UTF-8'
        end
        format.html { }
        format.js { }
        format.xls
      end

    elsif params[:report_for] === 'certificate'
      @issued_certificates = IssuedCertificate.where(cetrificate_name: params[:certificate])
      @students = []

      @issued_certificates.each do |cert|
        @students << cert.student if cert.student.standards.exists?(params[:standard_id])
      end

      respond_to do |format|
        format.pdf do
          render pdf: "students", encoding: 'UTF-8'
        end
        format.html { }
        format.js { }
        format.xls
      end

    else
      @standard = Standard.find(params[:standard_id]) if params[:standard_id]
      if @standard
        @students = @standard.students
      else
        @students = Student.all
      end

      respond_to do |format|
        format.pdf do
          render pdf: "students", encoding: 'UTF-8'
        end
        format.html { }
        format.js { }
        format.xls
      end
    end
  end
end
