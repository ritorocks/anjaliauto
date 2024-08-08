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

ActiveRecord::Schema[7.1].define(version: 2024_08_08_192918) do
  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "turo_profile"
    t.integer "phone"
    t.integer "trips_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.integer "vehicle_id"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "turo_reservation_number"
    t.date "start_date"
    t.time "start_time"
    t.date "end_date"
    t.time "end_time"
    t.integer "vehicle_id"
    t.integer "guest_id"
    t.integer "total_distance_included"
    t.integer "estimated_earnings"
    t.string "start_day"
    t.string "end_day"
    t.string "extras"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.integer "year"
    t.string "make"
    t.string "model"
    t.string "color"
    t.integer "trips_count"
    t.integer "jobs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
