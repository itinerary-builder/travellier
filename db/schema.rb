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

ActiveRecord::Schema.define(version: 2021_03_02_115501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "morning_id"
    t.bigint "lunch_id"
    t.bigint "afternoon_id"
    t.bigint "dinner_id"
    t.bigint "evening_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["afternoon_id"], name: "index_days_on_afternoon_id"
    t.index ["dinner_id"], name: "index_days_on_dinner_id"
    t.index ["evening_id"], name: "index_days_on_evening_id"
    t.index ["itinerary_id"], name: "index_days_on_itinerary_id"
    t.index ["lunch_id"], name: "index_days_on_lunch_id"
    t.index ["morning_id"], name: "index_days_on_morning_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.integer "duration"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.float "lat"
    t.float "lng"
    t.text "description"
    t.string "link_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "days", "itineraries"
  add_foreign_key "days", "places", column: "afternoon_id"
  add_foreign_key "days", "places", column: "dinner_id"
  add_foreign_key "days", "places", column: "evening_id"
  add_foreign_key "days", "places", column: "lunch_id"
  add_foreign_key "days", "places", column: "morning_id"
  add_foreign_key "itineraries", "users"
end
