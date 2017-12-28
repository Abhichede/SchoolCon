json.extract! time_table, :id, :standard_id, :division, :day, :start_time, :end_time, :teacher_id, :subject, :created_at, :updated_at
json.url time_table_url(time_table, format: :json)
