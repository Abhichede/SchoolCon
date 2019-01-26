json.extract! exam_mark, :id, :student_id, :exam_id, :exam_subject_id, :written_marks, :assessment_marks, :created_at, :updated_at
json.url exam_mark_url(exam_mark, format: :json)
