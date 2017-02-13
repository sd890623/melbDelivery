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

ActiveRecord::Schema.define(version: 20170124060952) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "shop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["shop_id"], name: "index_categories_on_shop_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",                     null: false
    t.float    "price",                    null: false
    t.text     "description"
    t.integer  "stock",       default: 99, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "shop_id"
    t.integer  "category_id"
    t.string   "image"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["shop_id"], name: "index_items_on_shop_id"
  end

  create_table "items_orders", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id", unique: true
    t.index ["item_id"], name: "index_items_orders_on_item_id"
    t.index ["order_id"], name: "index_items_orders_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "phone",                                  null: false
    t.string   "address",                                null: false
    t.string   "delivery_time",                          null: false
    t.string   "delivery_method",                        null: false
    t.boolean  "is_paid",         default: false
    t.text     "note"
    t.float    "delivery_fee",                           null: false
    t.float    "total_fee",                              null: false
    t.integer  "shop_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "deleted_at"
    t.string   "status",          default: "processing", null: false
    t.index ["deleted_at"], name: "index_orders_on_deleted_at"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "time",       null: false
    t.integer  "rating",     null: false
    t.text     "comment",    null: false
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "mobile",                              null: false
    t.string   "address_street",                      null: false
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image"
    t.integer  "open_hour",       default: 9
    t.integer  "close_hour",      default: 22
    t.string   "delivery_method", default: "default"
    t.string   "address_suburb",                      null: false
    t.datetime "deleted_at"
    t.boolean  "takeaway_only",   default: false,     null: false
    t.index ["deleted_at"], name: "index_shops_on_deleted_at"
  end

end
