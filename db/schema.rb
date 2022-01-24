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

ActiveRecord::Schema.define(version: 2022_01_24_185312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "basket_id"
    t.integer "quantity"
    t.integer "price"
    t.integer "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_basket_items_on_basket_id"
    t.index ["item_id"], name: "index_basket_items_on_item_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.integer "price"
    t.integer "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "basket_items", "baskets"
  add_foreign_key "basket_items", "items"
end
