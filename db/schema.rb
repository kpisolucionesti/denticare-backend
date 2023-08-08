# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_08_150539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.integer "ci"
    t.string "name"
    t.bigint "speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["speciality_id"], name: "index_doctors_on_speciality_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_dates", force: :cascade do |t|
    t.bigint "patient_id"
    t.date "ingress_date"
    t.bigint "doctor_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_medical_dates_on_doctor_id"
    t.index ["patient_id"], name: "index_medical_dates_on_patient_id"
    t.index ["room_id"], name: "index_medical_dates_on_room_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "ci"
    t.string "name"
    t.date "birth_date"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "ci"
    t.string "name"
    t.bigint "job_id_id"
    t.bigint "role_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id_id"], name: "index_users_on_job_id_id"
    t.index ["role_id_id"], name: "index_users_on_role_id_id"
  end

end
