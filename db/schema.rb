# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_31_220144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_files", force: :cascade do |t|
    t.float "income"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "description"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "merchant_id", null: false
    t.bigint "product_id", null: false
    t.bigint "purchaser_id", null: false
    t.bigint "data_file_id", null: false
    t.integer "product_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_file_id"], name: "index_purchases_on_data_file_id"
    t.index ["merchant_id"], name: "index_purchases_on_merchant_id"
    t.index ["product_id"], name: "index_purchases_on_product_id"
    t.index ["purchaser_id"], name: "index_purchases_on_purchaser_id"
  end

  add_foreign_key "purchases", "data_files"
  add_foreign_key "purchases", "merchants"
  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "purchasers"
end
