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

ActiveRecord::Schema.define(version: 20160314002923) do

  create_table "activities", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.float   "distance"
    t.integer "moving_time"
    t.string  "activity_type"
    t.string  "start_date_local"
    t.integer "average_heartrate"
    t.boolean "device_watts"
    t.integer "average_watts"
    t.float   "kilojoules"
    t.integer "suffer_score"
  end

  create_table "fatigues", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "date"
    t.integer  "fatigue_score"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string   "strava_key_secret"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "fitbit_key_secret"
    t.string   "fitbit_key_refresh"
  end

  create_table "motions", force: :cascade do |t|
    t.string   "date"
    t.integer  "steps"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "user_id"
    t.string   "avatar_link"
    t.string   "location"
    t.boolean  "strava_premium"
    t.string   "gender"
    t.float    "weight"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_followers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_follower_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end
