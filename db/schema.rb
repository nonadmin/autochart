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

ActiveRecord::Schema.define(version: 20160118213916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "autotask_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "clients", ["name"], name: "index_clients_on_name", unique: true, using: :btree

  create_table "issue_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "autotask_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "title"
    t.integer  "issue_type_id"
    t.integer  "client_id"
    t.integer  "autotask_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "last_activity"
  end

  create_table "time_entries", force: :cascade do |t|
    t.decimal  "hours_to_bill", precision: 8, scale: 4, null: false
    t.datetime "date_worked",                           null: false
    t.integer  "ticket_id",                             null: false
    t.integer  "autotask_id",                           null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "time_entries", ["ticket_id"], name: "index_time_entries_on_ticket_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
  end

end
