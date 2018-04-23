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

ActiveRecord::Schema.define(version: 2018_04_23_065510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "title"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsvp_lists", force: :cascade do |t|
    t.bigint "event_id"
    t.string "name"
    t.text "email"
    t.text "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvp_lists_on_event_id"
  end

  create_table "user_event_data", force: :cascade do |t|
    t.text "relation"
    t.text "user_role"
    t.boolean "attending"
    t.text "diet"
    t.integer "additional_persons"
    t.integer "num_babies"
    t.integer "num_toddlers"
    t.boolean "require_carpark"
    t.boolean "attended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.bigint "user_event_datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_users_events_on_event_id"
    t.index ["user_event_datum_id"], name: "index_users_events_on_user_event_datum_id"
    t.index ["user_id"], name: "index_users_events_on_user_id"
  end

  add_foreign_key "rsvp_lists", "events"
  add_foreign_key "users_events", "events"
  add_foreign_key "users_events", "user_event_data"
  add_foreign_key "users_events", "users"
end
