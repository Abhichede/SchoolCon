json.extract! student, :id, :self_full_name, :date_of_birth, :gender,
              :student_mobile, :blood_group, :nationality, :mother_tongue,
              :father_full_name, :mother_full_name, :residential_address,
              :permanent_address, :father_mobile, :mother_mobile,
              :father_occupation, :mother_occupation, :father_email, :mother_email,
              :student_email, :prn, :transport_pickup_point, :profile_photo,
              :current_total_fee, :current_total_discount, :current_total_fine,
              :current_total_paid, :current_balance_amount
json.standard {
  json.partial! "standards/standard", standard: student.standards.last
}
json.division {
  json.partial! "divisions/division", division: student.divisions.last
}
json.caste_category {
  json.partial! "caste_categories/caste_category", caste_category: student.caste_category
}
json.caste {
  json.partial! "castes/caste", caste: student.caste
}
json.religion {
  json.partial! "religions/religion", religion: student.religion
}
