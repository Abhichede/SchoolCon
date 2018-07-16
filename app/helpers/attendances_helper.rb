module AttendancesHelper
  def monthly_summary(attendances, student)
    present_days = 0
    absend_days = 0

    attendances.each do |attendance|
      attendance.att_data["#{student.id}"] === 'on' ? present_days += 1 : absend_days += 1
    end

    all_attendances = attendances.count
    present_days
    absend_days
  end
end
