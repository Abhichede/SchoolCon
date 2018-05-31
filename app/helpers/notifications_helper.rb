module NotificationsHelper

  def birthday_wish(student_id)
    desc = MyTemplate.find_by_name('Birthday Message').desc
    @student = Student.find(student_id)

    strip_tags(desc.gsub! '#{student_name}', @student.self_full_name)
  end
end
