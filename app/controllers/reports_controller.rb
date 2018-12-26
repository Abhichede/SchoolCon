class ReportsController < ApplicationController
  def index
  end

  def student_report
    if params[:report_for] === 'gender'
      @students = Student.where(gender: params[:gender])

      respond_to do |format|
        format.html { }
        format.js { }
      end
    elsif params[:report_for] === 'blood_group'
       @students = Student.where(blood_group: params[:blood_group])

       respond_to do |format|
         format.html { }
         format.js { }
       end
    elsif params[:report_for] === 'category'
      @category = CasteCategory.find(params[:category])

      @students = @category.students

      respond_to do |format|
        format.html { }
        format.js { }
      end
    elsif params[:report_for] === 'caste'
      @caste = Caste.find(params[:caste])

      @students = @caste.students

      respond_to do |format|
        format.html { }
        format.js { }
      end
    elsif params[:report_for] === 'religion'
      @religion = Religion.find(params[:religion])

      @students = @religion.students

      respond_to do |format|
        format.html { }
        format.js { }
      end
    end
  end
end
