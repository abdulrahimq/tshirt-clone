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

ActiveRecord::Schema.define(version: 2019_04_09_015024) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tshirt_id"
    t.bigint "order_id"
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["tshirt_id"], name: "index_items_on_tshirt_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "tshirt_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "MXN", null: false
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total"
    t.string "status"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "tshirts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "photo"
    t.bigint "user_id"
    t.string "tags"
    t.float "price", default: 10.0
    t.string "sku"
    t.integer "price_cents", default: 2500
    t.string "x"
    t.string "y"
    t.string "height"
    t.string "width"
    t.index ["user_id"], name: "index_tshirts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "type_of"
    t.boolean "admin"
    t.string "photo"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
<<<<<<< HEAD
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
=======
    t.text "description"
>>>>>>> 9927af135bc8ef2e992c57a60f467d5a85be8dd0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "services", "users"
  add_foreign_key "tshirts", "users"
end
