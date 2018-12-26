if attendance.att_data.nil?
  if monthly_summary.nil?
    json.total_days 0
    json.present_days 0
    json.absent_days 0
  else
    all_attendances = monthly_summary.count
    present_days = 0
    absent_days = 0

    monthly_summary.each do |attendance|
      attendance.att_data["#{student.id}"] === 'on' ? present_days += 1 : absent_days += 1
    end

    json.total_days all_attendances
    json.present_days present_days
    json.absent_days absent_days

  end
elsif student
  json.extract! attendance, :id, :date
  if student
    json.is_present attendance.filter_by_student(student)
  end
  if monthly_summary.nil?
    json.total_days 0
    json.present_days 0
    json.absent_days 0
  else
    all_attendances = monthly_summary.count
    present_days = 0
    absent_days = 0

    monthly_summary.each do |attendance|
      attendance.att_data["#{student.id}"] === 'on' ? present_days += 1 : absent_days += 1
    end

    json.total_days all_attendances
    json.present_days present_days
    json.absent_days absent_days

  end
else
  json.extract! attendance, :id, :date, :subject_id, :standard_id, :division_id, :academic_year_id, :teacher_id, :att_data
end