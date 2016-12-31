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

ActiveRecord::Schema.define(version: 20161231030800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       default: "My calendar"
    t.string   "type",                               null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["user_id"], name: "index_calendars_on_user_id", using: :btree
  end

  create_table "days", force: :cascade do |t|
    t.integer  "calendar_id"
    t.string   "image_url",    null: false
    t.string   "location",     null: false
    t.string   "trend_of_day"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["calendar_id"], name: "index_days_on_calendar_id", using: :btree
  end

  create_table "trends", force: :cascade do |t|
    t.string   "hashtag",    null: false
    t.integer  "day_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_trends_on_day_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "twitter_handle"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
