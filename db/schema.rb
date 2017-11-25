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

ActiveRecord::Schema.define(version: 20171120230233) do

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.decimal  "max_price",  precision: 10, scale: 2
    t.integer  "quantity"
    t.text     "comment"
    t.integer  "list_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.integer  "total_capacity", default: 10
    t.integer  "shop_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "list_id"
    t.index ["shop_id"], name: "index_lists_on_shop_id", unique: true
  end

  create_table "shops", force: :cascade do |t|
    t.string   "location"
    t.datetime "date"
    t.string   "shop_kind"
    t.string   "shopper"
    t.decimal  "total_price", precision: 10, scale: 2
    t.boolean  "is_complete",                          default: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

end
