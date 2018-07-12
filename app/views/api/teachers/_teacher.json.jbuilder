json.extract! teacher, :id, :fullname, :address, :contact, :email, :gender
json.subjects{
  json.array! teacher.subjects, partial: 'api/subjects/subject', as: :subject
}