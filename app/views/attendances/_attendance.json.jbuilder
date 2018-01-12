json.extract! attendance, :id, :date, :time, :standard_id, :division_id, :teacher_id, :att_data, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
