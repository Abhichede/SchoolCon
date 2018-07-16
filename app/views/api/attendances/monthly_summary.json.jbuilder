if @attendances.nil?
  json.total_days 0
  json.present_days 0
  json.absent_days 0
else
  all_attendances = @attendances.count
  present_days = 0
  absent_days = 0

  @attendances.each do |attendance|
    attendance.att_data["#{@student.id}"] === 'on' ? present_days += 1 : absent_days += 1
  end

  json.total_days all_attendances
  json.present_days present_days
  json.absent_days absent_days

end