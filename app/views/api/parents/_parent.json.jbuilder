json.extract! parent, :id, :name, :mobile, :created_at, :updated_at
json.students{
  json.array! parent.students, partial: 'api/parents/student', as: :student
}
json.url parent_url(parent, format: :json)
