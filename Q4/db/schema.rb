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

ActiveRecord::Schema.define(version: 2022_12_21_154036) do

  create_table "adresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "country"
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_adresses_on_person_id"
  end

  create_table "drives", force: :cascade do |t|
    t.datetime "date"
    t.integer "distance"
    t.integer "person_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_drives_on_person_id"
    t.index ["vehicle_id"], name: "index_drives_on_vehicle_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "student_number"
    t.integer "salary"
    t.integer "type", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "model"
    t.string "plate_number"
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_vehicles_on_person_id"
  end

end
