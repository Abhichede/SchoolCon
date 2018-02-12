class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :date_of_birth
      t.string :birth_place
      t.string :gender
      t.string :student_mobile
      t.string :blood_group
      t.string :nationality
      t.string :mother_tongue
      t.integer :caste_category_id
      t.integer :caste_id
      t.integer :religion_id
      t.string :father_first_name
      t.string :father_middle_name
      t.string :father_last_name
      t.string :mother_first_name
      t.string :mother_middle_name
      t.string :mother_last_name
      t.string :residential_address_one
      t.string :residential_address_two
      t.string :residential_city
      t.string :residential_state
      t.string :residential_country
      t.string :residential_pincode
      t.string :permanent_address_one
      t.string :permanent_address_two
      t.string :permanent_city
      t.string :permanent_state
      t.string :permanent_country
      t.string :permanent_pincode
      t.string :father_mobile
      t.string :mother_mobile
      t.string :father_occupation
      t.string :mother_occupation
      t.string :father_email
      t.string :mother_email
      t.string :student_email
      t.integer :standard_id
      t.string :prn
      t.string :last_school_attended
      t.string :username
      t.string :password
      t.integer :academic_year_id
      t.string :prev_standard
      t.string :prev_year
      t.string :prev_marks

      t.integer :division_id
      t.string :joining_date
      t.string :roll_no
      t.string :student_adhar
      t.string :father_adhar
      t.string :mother_adhar

      t.timestamps
    end
  end
end
