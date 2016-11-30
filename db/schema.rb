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

ActiveRecord::Schema.define(version: 20161129191228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "numeric_entries", force: :cascade do |t|
    t.integer  "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_entries", force: :cascade do |t|
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeline_entries", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "timeline_id", null: false
    t.integer  "entry_id",    null: false
    t.string   "entry_type",  null: false
  end

  add_index "timeline_entries", ["entry_type", "entry_id"], name: "index_timeline_entries_on_entry_type_and_entry_id", using: :btree
  add_index "timeline_entries", ["timeline_id"], name: "index_timeline_entries_on_timeline_id", using: :btree

  create_table "timelines", force: :cascade do |t|
    t.string   "name",                                           null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "user_id",                                        null: false
    t.text     "question",      default: "What's the question?", null: false
    t.integer  "timeline_type", default: 0,                      null: false
  end

  add_index "timelines", ["user_id"], name: "index_timelines_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
