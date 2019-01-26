json.extract! exam_subject, :id, :subject_id, :exam_id, :max_marks, :pass_marks, :written_marks, :assessment_marks, :created_at, :updated_at
json.url exam_subject_url(exam_subject, format: :json)
