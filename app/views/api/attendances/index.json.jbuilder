if @student.nil?
  json.array! @attendances, partial: 'api/attendances/attendance', locals: {student: nil, monthly_summary: nil}, as: :attendance
else
  json.array! @attendances, partial: 'api/attendances/attendance', locals: {student: @student, monthly_summary: @attendances_monthly_summary}, as: :attendance
end