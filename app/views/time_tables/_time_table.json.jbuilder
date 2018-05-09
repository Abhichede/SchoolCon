json.extract! time_table, :id, :standard_id, :division, :day, :start_time_local, :end_time_local, :teacher_id, :subject, :created_at, :updated_at
json.teacher{
  json.partial! "teachers/teacher", teacher: time_table.teacher
}
json.url time_table_url(time_table, format: :json)
