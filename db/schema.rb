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

ActiveRecord::Schema.define(version: 20180201081311) do

  create_table "academic_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "start_month"
    t.string "start_year"
    t.string "end_month"
    t.string "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active"
  end

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "date"
    t.integer "standard_id"
    t.integer "division_id"
    t.integer "teacher_id"
    t.json "att_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
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
  end

  create_table "fee_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "standard_id"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fee_categories_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "student_id", null: false
    t.bigint "fee_category_id", null: false
    t.index ["fee_category_id", "student_id"], name: "index_fee_categories_students_on_fee_category_id_and_student_id"
    t.index ["student_id", "fee_category_id"], name: "index_fee_categories_students_on_student_id_and_fee_category_id"
  end

  create_table "religions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standards_teachers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "standard_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["standard_id", "teacher_id"], name: "index_standards_teachers_on_standard_id_and_teacher_id"
    t.index ["teacher_id", "standard_id"], name: "index_standards_teachers_on_teacher_id_and_standard_id"
  end

  create_table "student_fee_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "academic_year_id"
    t.date "payment_date"
    t.string "payment_mode"
    t.text "payment_desc"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_wise_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.string "description"
    t.string "amount"
    t.integer "academic_year_id"
    t.boolean "is_payment_done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "joining_date"
    t.string "roll_no"
    t.string "student_adhar"
    t.string "father_adhar"
    t.string "mother_adhar"
    t.integer "division_id"
    t.string "prev_standard"
    t.string "prev_year"
    t.string "prev_marks"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "standard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects_teachers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["subject_id", "teacher_id"], name: "index_subjects_teachers_on_subject_id_and_teacher_id"
    t.index ["teacher_id", "subject_id"], name: "index_subjects_teachers_on_teacher_id_and_subject_id"
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.text "address_one"
    t.string "contact"
    t.string "standard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "time_table_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.time "school_start", default: "2000-01-01 08:00:00"
    t.time "school_end", default: "2000-01-01 18:00:00"
    t.integer "period_duration", default: 60
    t.integer "num_breaks", default: 3
    t.string "break_durations", default: "30, 60, 30"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "breaks_after", default: "11:00 AM, 01:30 PM, 04:30 PM"
  end

  create_table "time_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "standard_id"
    t.string "division"
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.integer "teacher_id"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color", default: "BLACK"
  end

end
