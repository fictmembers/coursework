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

ActiveRecord::Schema.define(version: 20160106133309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "login"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "administrators", ["login"], name: "index_administrators_on_login", unique: true, using: :btree
  add_index "administrators", ["remember_token"], name: "index_administrators_on_remember_token", using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "cashier_id"
    t.integer  "customer_id"
    t.string   "lang"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
  end

  create_table "cashiers", force: :cascade do |t|
    t.string   "lastname"
    t.string   "lang"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "chefs", force: :cascade do |t|
    t.string   "lastname"
    t.string   "lang"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "halls", force: :cascade do |t|
    t.string   "hall_type"
    t.integer  "restaurant_id"
    t.string   "lang"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hostesses", force: :cascade do |t|
    t.string   "lastname"
    t.integer  "restaurant_id"
    t.string   "lang"
    t.integer  "hall_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "price"
    t.string   "description"
    t.integer  "restaurant_id"
    t.string   "lang"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "menu_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string   "lastname"
    t.string   "lang"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "cuisine"
    t.string   "lang"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
  end

  add_index "menus", ["cuisine"], name: "index_menus_on_cuisine", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "from_member"
    t.integer  "to_member"
    t.string   "theme"
    t.string   "text"
    t.boolean  "viewed",      default: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "customer_id"
    t.integer  "waiter_id"
    t.integer  "manager_id"
    t.integer  "chef_id"
    t.string   "lang"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.datetime "reserv_time"
    t.integer  "from"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "table_id"
    t.integer  "customer_id"
  end

  add_index "reservations", ["table_id", "reserv_time", "from"], name: "index_reservations_on_table_id_and_reserv_time_and_from", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_books", force: :cascade do |t|
    t.string   "review"
    t.string   "lang"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "review_type"
    t.integer  "restaurant_id"
    t.string   "customer"
  end

  create_table "tables", force: :cascade do |t|
    t.integer  "visnumber"
    t.boolean  "status",        default: false
    t.integer  "restaurant_id"
    t.integer  "hall_id"
    t.integer  "waiter_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "photo"
    t.integer  "customer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "waiters", force: :cascade do |t|
    t.string   "lastname"
    t.integer  "restaurant_id"
    t.string   "lang"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
