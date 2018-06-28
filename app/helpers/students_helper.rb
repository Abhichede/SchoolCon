module StudentsHelper
  def fill_certificate_template
    @bonafide_template.desc.gsub! '#{institute_logo}', "#{wicked_pdf_image_tag current_institute.logo.url, height: 80, width: 180}"
    @bonafide_template.desc.gsub! '#{institute_name}', current_institute.name
    @bonafide_template.desc.gsub! '#{institute_address}', current_institute.address
    @bonafide_template.desc.gsub! '#{institute_contact}', current_institute.contact
    @bonafide_template.desc.gsub! '#{institute_gst_no}', current_institute.gst_no
    @bonafide_template.desc.gsub! '#{institute_registration_no}', current_institute.registration_no
    @bonafide_template.desc.gsub! '#{student_name}', @student.self_full_name
    @bonafide_template.desc.gsub! '#{student_contact}', @student.student_mobile
    @bonafide_template.desc.gsub! '#{student_mother_name}', @student.mother_first_name
    @bonafide_template.desc.gsub! '#{student_father_name}', @student.father_first_name
    @bonafide_template.desc.gsub! '#{admission_year}', "#{@student.joining_date.to_date.year}"
    @bonafide_template.desc.gsub! '#{academic_year}', @student.academic_years.last.end_year
    @bonafide_template.desc.gsub! '#{student_dob}', @student.date_of_birth
    @bonafide_template.desc.gsub! '#{student_id}', @student.id.to_s
    @bonafide_template.desc.gsub! '#{certificate_no}', @student.id.to_s
    @bonafide_template.desc.gsub! '#{student_standard}', @student.standards.last.name
    @bonafide_template.desc.gsub! '#{student_division}', @student.divisions.last.name
    @bonafide_template.desc.gsub! '#{date}', Date.today.to_s
  end
end
