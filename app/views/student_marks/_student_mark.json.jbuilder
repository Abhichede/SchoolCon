json.extract! student_mark, :id, :student_id, :exam_id, :subject_id, :marks, :created_at, :updated_at
json.url student_mark_url(student_mark, format: :json)
