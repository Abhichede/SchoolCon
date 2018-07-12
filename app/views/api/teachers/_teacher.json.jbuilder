json.extract! teacher, :id, :fullname, :address, :contact
json.subjects{
  json.array! teacher.subjects, partial: 'api/subjects/subject', as: :subject
}