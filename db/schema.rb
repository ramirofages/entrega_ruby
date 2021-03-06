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

ActiveRecord::Schema.define(version: 20151215194408) do

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "gender"
    t.integer  "document_number"
    t.string   "cuit"
    t.string   "email"
    t.integer  "phone_number"
    t.string   "skype"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "cuit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "isJuridic"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "person_id"
    t.text     "description"
    t.integer  "total_amount"
    t.date     "emission_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "receipts", ["client_id"], name: "index_receipts_on_client_id"
  add_index "receipts", ["person_id"], name: "index_receipts_on_person_id"

end
