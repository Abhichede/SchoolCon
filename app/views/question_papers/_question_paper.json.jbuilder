json.extract! question_paper, :id, :subject_id, :name, :created_at, :updated_at
json.url question_paper_url(question_paper, format: :json)
