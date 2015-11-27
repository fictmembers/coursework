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

ActiveRecord::Schema.define(version: 20151127182112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "LASTMANE"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "bills", force: :cascade do |t|
    t.datetime "CREATED"
    t.string   "OPTIONS"
    t.integer  "SUMMARY"
    t.integer  "cashier_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cashiers", force: :cascade do |t|
    t.string   "LASTNAME"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "chefs", force: :cascade do |t|
    t.string   "LASTNAME"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "LASTNAME"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "halls", force: :cascade do |t|
    t.string   "HALL_TYPE"
    t.integer  "CAPACITY"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hostesses", force: :cascade do |t|
    t.string   "NAME"
    t.integer  "restaurant_id"
    t.integer  "hall_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "PRICE"
    t.string   "DESCRIPTION"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "customer_id"
    t.integer  "waiter_id"
    t.integer  "administrator_id"
    t.integer  "chef_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parts", ["item_id"], name: "index_parts_on_item_id", using: :btree
  add_index "parts", ["order_id"], name: "index_parts_on_order_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.datetime "RESERV_TIME"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "NAME"
    t.string   "ADRESS"
    t.string   "TEL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_books", force: :cascade do |t|
    t.string   "REVIEW"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tables", force: :cascade do |t|
    t.integer  "VISNUMBER"
    t.boolean  "STATUS",         default: true
    t.integer  "restaurant_id"
    t.integer  "reservation_id"
    t.integer  "waiter_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "waiters", force: :cascade do |t|
    t.string   "LASTNAME"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
