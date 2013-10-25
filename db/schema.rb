# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131023021930) do

  create_table "chairs", force: true do |t|
    t.string   "lname"
    t.string   "fname"
    t.string   "mi"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "chairs", ["department_id"], name: "index_chairs_on_department_id"

  create_table "days", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days_schedules", id: false, force: true do |t|
    t.integer "schedule_id", null: false
    t.integer "day_id",      null: false
  end

  add_index "days_schedules", ["schedule_id"], name: "index_days_schedules_on_schedule_id"

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "chair_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["chair_id"], name: "index_departments_on_chair_id"

  create_table "professors", force: true do |t|
    t.string   "lname"
    t.string   "fname"
    t.string   "mi"
    t.string   "status"
    t.integer  "units"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.integer  "user_id"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "section_id"
    t.integer  "subject_id"
    t.time     "start_time",   limit: 255
    t.string   "time"
    t.time     "finish_time",  limit: 255
    t.integer  "professor_id"
    t.integer  "room_id"
    t.integer  "day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["day_id"], name: "index_schedules_on_day_id"
  add_index "schedules", ["professor_id"], name: "index_schedules_on_professor_id"
  add_index "schedules", ["room_id"], name: "index_schedules_on_room_id"
  add_index "schedules", ["section_id"], name: "index_schedules_on_section_id"
  add_index "schedules", ["subject_id"], name: "index_schedules_on_subject_id"

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.integer  "yearlevel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["department_id"], name: "index_sections_on_department_id"

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "units"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["department_id"], name: "index_subjects_on_department_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
