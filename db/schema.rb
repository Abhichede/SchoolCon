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

ActiveRecord::Schema.define(version: 20171228174520) do

  create_table "standards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "no_of_divisions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standards_teachers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "standard_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["standard_id", "teacher_id"], name: "index_standards_teachers_on_standard_id_and_teacher_id"
    t.index ["teacher_id", "standard_id"], name: "index_standards_teachers_on_teacher_id_and_standard_id"
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
    t.string "name"
    t.text "address"
    t.string "contact"
    t.string "standard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
