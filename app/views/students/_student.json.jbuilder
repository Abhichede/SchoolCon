json.extract! student, :id, :first_name, :middle_name, :last_name,
              :date_of_birth, :birth_place, :gender, :student_mobile, :blood_group,
              :nationality, :mother_tongue, :caste_category_id, :caste_id, :religion_id,
              :father_first_name, :father_middle_name, :father_last_name, :mother_first_name,
              :mother_middle_name, :mother_last_name, :residential_address_one,
              :residential_address_two, :residential_city, :residential_state,
              :residential_country, :residential_pincode, :permanent_address_one,
              :permanent_address_two, :permanent_city, :permanent_state,
              :permanent_country, :permanent_pincode, :father_mobile, :mother_mobile,
              :father_occupation, :mother_occupation, :father_email, :mother_email,
              :student_email, :prn, :last_school_attended, :joining_date, :roll_no, :student_adhar, :father_adhar,
              :prev_standard, :prev_year, :prev_marks, :mother_adhar, :is_enquiry, :medical_history, :skill_of_child,
              :disability_of_student, :siblings_schooling_details,
              :is_transportation_required, :transport_pickup_point, :created_at, :updated_at, :profile_photo
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
json.fees {
  json.array! student.student_fee_payments, partial: 'student_fee_payments/student_fee_payment', as: :student_fee_payment
}

json.url student_url(student, format: :json)
