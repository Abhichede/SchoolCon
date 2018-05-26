json.extract! student, :id, :self_full_name, :date_of_birth, :gender,
              :student_mobile, :blood_group, :nationality, :mother_tongue,
              :father_full_name, :mother_full_name, :residential_address,
              :permanent_address, :father_mobile, :mother_mobile,
              :father_occupation, :mother_occupation, :father_email, :mother_email,
              :student_email, :prn, :transport_pickup_point, :profile_photo,
              :current_total_fee, :current_total_discount, :current_total_fine,
              :current_total_paid, :current_balance_amount
json.standard {
  json.partial! "standards/standard", standard: student.standards.last
}
json.division {
  json.partial! "divisions/division", division: student.divisions.last
}
json.caste_category {
  json.partial! "caste_categories/caste_category", caste_category: student.caste_category
}
json.caste {
  json.partial! "castes/caste", caste: student.caste
}
json.religion {
  json.partial! "religions/religion", religion: student.religion
}
json.timetable_monday{
  json.array! student.timetable("Monday"), partial: 'time_tables/time_table', as: :time_table
}
json.timetable_tuesday{
  json.array! student.timetable("Tuesday"), partial: 'time_tables/time_table', as: :time_table
}
json.timetable_wednesday{
  json.array! student.timetable("Wednesday"), partial: 'time_tables/time_table', as: :time_table
}
json.timetable_thursday{
  json.array! student.timetable("Thursday"), partial: 'time_tables/time_table', as: :time_table
}
json.timetable_friday{
  json.array! student.timetable("Friday"), partial: 'time_tables/time_table', as: :time_table
}
json.timetable_saturday{
  json.array! student.timetable("Saturday"), partial: 'time_tables/time_table', as: :time_table
}

json.url student_url(student, format: :json)
