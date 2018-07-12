json.array! @students, partial: 'api/students/student_all', as: :student

# json.students @students do |student|
#   json.id student.id
#   json.full_name student.self_full_name
#
#   json.notifications student.notifications do |notification|
#     json.id notification.id
#     json.message notification.message
#   end
# end