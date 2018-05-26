json.extract! class_teacher, :id, :division_id, :teacher_id, :standard_id
json.students{
  json.array! class_teacher.division.students, partial: 'students/class_teacher_students', as: :student
}
json.url class_teacher_url(class_teacher, format: :json)
