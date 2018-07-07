json.extract! parent_message, :id, :student_id, :teacher_id, :message, :created_at, :updated_at
json.url parent_message_url(parent_message, format: :json)
