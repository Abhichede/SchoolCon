json.extract! assessment, :id, :assessment_type, :standard_id, :division_id, :integer, :assessment_name, :max_marks, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)
