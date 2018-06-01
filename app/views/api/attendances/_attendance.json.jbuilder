if attendance.nil?
  json.extract! attendance, :id, :date
  if student
    json.is_present attendance.filter_by_student(student)
  end
  json.url attendance_url(attendance, format: :json)
end