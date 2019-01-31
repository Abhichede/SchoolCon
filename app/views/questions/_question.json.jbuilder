json.extract! question, :id, :standard_id, :division_id, :subject_id, :teacher_id, :question, :answer, :marks, :created_at, :updated_at
json.url question_url(question, format: :json)
