json.extract! student, :id, :self_full_name, :date_of_birth, :gender,
              :student_mobile, :father_mobile, :mother_mobile,
              :father_email, :mother_email, :student_email, :prn, :profile_photo,
              :current_total_fee, :current_total_discount, :current_total_fine,
              :current_total_paid, :current_balance_amount
json.standard {
  json.partial! "api/standards/standard", standard: student.standards.last
}
json.division {
  json.partial! "api/divisions/division", division: student.divisions.last
}