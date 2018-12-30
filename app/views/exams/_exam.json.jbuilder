json.extract! exam, :id, :exam_term_id, :exam_name, :created_at, :updated_at
json.url exam_url(exam, format: :json)
