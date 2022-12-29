# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_29_094610) do
  create_table "carbon_credits", force: :cascade do |t|
    t.string "amount"
    t.integer "price"
    t.string "source"
    t.string "image"
    t.boolean "approved", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carbon_credits_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "buyer_phone_number"
    t.string "buyer_location"
    t.integer "user_id", null: false
    t.integer "carbon_credit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carbon_credit_id"], name: "index_purchases_on_carbon_credit_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carbon_credits", "users"
  add_foreign_key "purchases", "carbon_credits"
  add_foreign_key "purchases", "users"
end
