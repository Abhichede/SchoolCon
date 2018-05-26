json.extract! teacher, :id, :fullname, :address, :contact

json.class_teachers{
  json.array! teacher.class_teachers, partial: 'class_teachers/class_teacher', as: :class_teacher
}

json.url teacher_url(teacher, format: :json)
