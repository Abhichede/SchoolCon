json.extract! exam_term, :id, :term_name, :start_date, :end_date, :created_at, :updated_at
json.url exam_term_url(exam_term, format: :json)
