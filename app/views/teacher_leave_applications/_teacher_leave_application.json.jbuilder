json.extract! teacher_leave_application, :id, :teacher_id, :subject, :message, :is_approved, :created_at, :updated_at
json.url teacher_leave_application_url(teacher_leave_application, format: :json)
