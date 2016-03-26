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

ActiveRecord::Schema.define(version: 20141129012311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["group_id"], name: "index_categories_on_group_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "group_id_id"
    t.string   "what"
    t.string   "when"
    t.string   "why"
    t.string   "where"
    t.integer  "who_created_id"
    t.datetime "datetime_created"
    t.integer  "who_updated_id"
    t.datetime "datetime_updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["group_id_id"], name: "index_events_on_group_id_id", using: :btree
  add_index "events", ["who_created_id"], name: "index_events_on_who_created_id", using: :btree
  add_index "events", ["who_updated_id"], name: "index_events_on_who_updated_id", using: :btree

  create_table "followings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followings", ["group_id"], name: "index_followings_on_group_id", using: :btree
  add_index "followings", ["user_id"], name: "index_followings_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.integer  "who_created_id"
    t.datetime "datetime_created"
    t.integer  "who_updated_id"
    t.datetime "datetime_updated"
    t.integer  "based_in_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["based_in_id"], name: "index_groups_on_based_in_id", using: :btree
  add_index "groups", ["who_created_id"], name: "index_groups_on_who_created_id", using: :btree
  add_index "groups", ["who_updated_id"], name: "index_groups_on_who_updated_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "suggested_events", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "category_id"
    t.string   "what"
    t.string   "when"
    t.datetime "datetime_created"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suggested_events", ["category_id"], name: "index_suggested_events_on_category_id", using: :btree
  add_index "suggested_events", ["location_id"], name: "index_suggested_events_on_location_id", using: :btree

  create_table "user_locations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_locations", ["location_id"], name: "index_user_locations_on_location_id", using: :btree
  add_index "user_locations", ["user_id"], name: "index_user_locations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "is_admin"
    t.boolean  "is_editor"
    t.boolean  "is_viewer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
