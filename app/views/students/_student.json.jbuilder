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
              :student_email, :standard_id, :prn, :last_school_attended, :username,
              :password, :academic_year_id, :created_at, :updated_at, :profile_photo
json.url student_url(student, format: :json)
