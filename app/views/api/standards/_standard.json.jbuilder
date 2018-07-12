json.extract! standard, :id, :name
json.divisions{
  json.array! standard.divisions, partial: 'api/divisions/division', as: :division
}