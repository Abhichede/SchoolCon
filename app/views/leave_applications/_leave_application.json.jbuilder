json.extract! leave_application, :id, :subject, :message, :is_approved, :seen_date, :teacher_id, :student_id, :created_at, :updated_at
json.url leave_application_url(leave_application, format: :json)
