# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190130172040) do

  create_table "academic_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "start_month"
    t.string "start_year"
    t.string "end_month"
    t.string "end_year"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_academic_years_on_deleted_at"
  end

  create_table "academic_years_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "academic_year_id"
    t.bigint "student_id"
    t.index ["academic_year_id"], name: "index_academic_years_students_on_academic_year_id"
    t.index ["student_id"], name: "index_academic_years_students_on_student_id"
  end

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "date"
    t.integer "standard_id"
    t.integer "division_id"
    t.integer "teacher_id"
    t.json "att_data"
    t.integer "student_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "academic_year_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_attendances_on_deleted_at"
  end

  create_table "caste_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "castes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "division_id"
    t.integer "teacher_id"
    t.integer "standard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "standard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_divisions_on_deleted_at"
  end

  create_table "divisions_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "division_id"
    t.bigint "student_id"
    t.index ["division_id"], name: "index_divisions_students_on_division_id"
    t.index ["student_id"], name: "index_divisions_students_on_student_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_marks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "exam_id"
    t.integer "exam_subject_id"
    t.float "written_marks", limit: 24
    t.float "assessment_marks", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "subject_id"
    t.integer "exam_id"
    t.float "max_marks", limit: 24
    t.float "pass_marks", limit: 24
    t.float "written_marks", limit: 24
    t.float "assessment_marks", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "academic_year_id"
    t.string "name"
    t.integer "standard_id"
    t.integer "division_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fee_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "standard_id"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_fee_categories_on_deleted_at"
  end

  create_table "fee_categories_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "student_id", null: false
    t.bigint "fee_category_id", null: false
    t.index ["fee_category_id", "student_id"], name: "index_fee_categories_students_on_fee_category_id_and_student_id"
    t.index ["student_id", "fee_category_id"], name: "index_fee_categories_students_on_student_id_and_fee_category_id"
  end

  create_table "holidays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeworks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.integer "standard_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "division_id"
    t.date "date"
  end

  create_table "issued_certificates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.string "reason"
    t.string "cetrificate_name"
    t.text "certificate_content"
    t.integer "issued_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "subject"
    t.text "message"
    t.boolean "is_approved"
    t.datetime "seen_date"
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "message"
    t.string "from"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_notifications_on_deleted_at"
  end

  create_table "office_expense_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "particular"
    t.text "description"
    t.float "amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "parent_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_type"
  end

  create_table "parents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "post_id"
    t.string "attachment_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "standard_id"
    t.integer "division_id"
    t.integer "subject_id"
    t.integer "teacher_id"
    t.text "question"
    t.string "question_type"
    t.float "marks", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "religions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_religions_on_deleted_at"
  end

  create_table "school_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.string "registration_no"
    t.string "gst_no"
    t.string "email"
    t.string "code"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "desc"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_standards_on_deleted_at"
  end

  create_table "standards_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "standard_id"
    t.bigint "student_id"
    t.index ["standard_id"], name: "index_standards_students_on_standard_id"
    t.index ["student_id"], name: "index_standards_students_on_student_id"
  end

  create_table "standards_subjects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subject_id", null: false
    t.bigint "standard_id", null: false
    t.index ["standard_id", "subject_id"], name: "index_standards_subjects_on_standard_id_and_subject_id"
    t.index ["subject_id", "standard_id"], name: "index_standards_subjects_on_subject_id_and_standard_id"
  end

  create_table "standards_teachers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "standard_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["standard_id", "teacher_id"], name: "index_standards_teachers_on_standard_id_and_teacher_id"
    t.index ["teacher_id", "standard_id"], name: "index_standards_teachers_on_teacher_id_and_standard_id"
  end

  create_table "student_certificates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_student_certificates_on_deleted_at"
  end

  create_table "student_fee_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "academic_year_id"
    t.date "payment_date"
    t.string "payment_mode"
    t.text "payment_desc"
    t.float "amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_student_fee_payments_on_deleted_at"
  end

  create_table "student_marks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "exam_id"
    t.integer "subject_id"
    t.float "marks", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exam_subject_id"
  end

  create_table "student_wise_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "academic_year_id"
    t.text "description"
    t.string "amount"
    t.boolean "is_payment_done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_student_wise_discounts_on_deleted_at"
  end

  create_table "student_wise_fees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.string "fee_category"
    t.string "description"
    t.string "amount"
    t.integer "academic_year_id"
    t.boolean "is_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_student_wise_fees_on_deleted_at"
  end

  create_table "student_wise_fines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "academic_year_id"
    t.text "desciption"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_student_wise_fines_on_deleted_at"
  end

  create_table "student_wise_instant_fees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "academic_year_id"
    t.text "description"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_student_wise_instant_fees_on_deleted_at"
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "birth_place"
    t.string "gender"
    t.string "student_mobile"
    t.string "blood_group"
    t.string "nationality"
    t.string "mother_tongue"
    t.integer "caste_category_id"
    t.integer "caste_id"
    t.integer "religion_id"
    t.string "father_first_name"
    t.string "father_middle_name"
    t.string "father_last_name"
    t.string "mother_first_name"
    t.string "mother_middle_name"
    t.string "mother_last_name"
    t.string "residential_address_one"
    t.string "residential_address_two"
    t.string "residential_city"
    t.string "residential_state"
    t.string "residential_country"
    t.string "residential_pincode"
    t.string "permanent_address_one"
    t.string "permanent_address_two"
    t.string "permanent_city"
    t.string "permanent_state"
    t.string "permanent_country"
    t.string "permanent_pincode"
    t.string "father_mobile"
    t.string "mother_mobile"
    t.string "father_occupation"
    t.string "mother_occupation"
    t.string "father_email"
    t.string "mother_email"
    t.string "student_email"
    t.integer "standard_id"
    t.string "prn"
    t.string "last_school_attended"
    t.string "username"
    t.string "password"
    t.integer "academic_year_id"
    t.string "prev_standard"
    t.string "prev_year"
    t.string "prev_marks"
    t.integer "division_id"
    t.string "joining_date"
    t.string "roll_no"
    t.string "student_adhar"
    t.string "father_adhar"
    t.string "mother_adhar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_photo"
    t.integer "parent_id"
    t.boolean "is_enquiry", default: false
    t.datetime "deleted_at"
    t.string "medical_history", default: "NA"
    t.string "skill_of_child", default: "NA"
    t.text "siblings_schooling_details"
    t.boolean "is_transportation_required", default: false
    t.string "transport_pickup_point", default: ""
    t.string "disability_of_student", default: "NA"
    t.index ["deleted_at"], name: "index_students_on_deleted_at"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "desc"
    t.string "code"
  end

  create_table "subjects_teachers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["subject_id", "teacher_id"], name: "index_subjects_teachers_on_subject_id_and_teacher_id"
    t.index ["teacher_id", "subject_id"], name: "index_subjects_teachers_on_teacher_id_and_subject_id"
  end

  create_table "teacher_leave_applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "teacher_id"
    t.string "subject"
    t.text "message"
    t.boolean "is_approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.text "address_one"
    t.string "contact"
    t.string "standard_id"
    t.string "dob"
    t.string "gender"
    t.string "blood_group"
    t.string "email"
    t.string "last_name"
    t.string "address_two"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.string "middle_name"
    t.string "staff_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_table_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.time "school_start", default: "2000-01-01 08:00:00"
    t.time "school_end", default: "2000-01-01 18:00:00"
    t.integer "period_duration", default: 60
    t.integer "num_breaks", default: 3
    t.string "break_durations", default: "30, 60, 30"
    t.string "breaks_after", default: "11:00 AM, 01:30 PM, 04:30 PM"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "standard_id"
    t.string "division"
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.integer "teacher_id"
    t.string "subject"
    t.string "color", default: "BLACK"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_time_tables_on_deleted_at"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles_mask"
    t.boolean "approved", default: false, null: false
    t.integer "student_id"
    t.string "username"
    t.string "device_id"
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
