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

ActiveRecord::Schema.define(version: 20180914224644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotel_translations", force: :cascade do |t|
    t.integer  "hotel_id",    null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "hotel_translations", ["hotel_id"], name: "index_hotel_translations_on_hotel_id", using: :btree
  add_index "hotel_translations", ["locale"], name: "index_hotel_translations_on_locale", using: :btree

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "country_code"
    t.integer  "views_count",         default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "manager_id"
    t.integer  "average_price_cents", default: 0, null: false
  end

  add_index "hotels", ["manager_id"], name: "index_hotels_on_manager_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "authentication_token",   limit: 30
    t.boolean  "admin",                             default: false, null: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "hotels", "users", column: "manager_id"
end
