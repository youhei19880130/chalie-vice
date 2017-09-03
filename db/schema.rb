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

ActiveRecord::Schema.define(version: 20170903033228) do

  create_table "chalie_vice_item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.string   "image",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_chalie_vice_item_images_on_item_id", using: :btree
  end

  create_table "chalie_vice_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                        null: false
    t.integer  "price",                       null: false
    t.string   "category_name",               null: false
    t.text     "description",   limit: 65535
    t.text     "detail",        limit: 65535
    t.string   "url"
    t.string   "youtube_url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "chalie_vice_letter_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "letters_id"
    t.integer  "items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["items_id"], name: "index_chalie_vice_letter_items_on_items_id", using: :btree
    t.index ["letters_id"], name: "index_chalie_vice_letter_items_on_letters_id", using: :btree
  end

  create_table "chalie_vice_letters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                     null: false
    t.string   "category_name",                            null: false
    t.text     "body",          limit: 65535
    t.string   "url",                                      null: false
    t.string   "friend_name",                 default: ""
    t.string   "friend_title",                default: ""
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "thumb_image"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "size"
    t.string   "color"
    t.integer  "chalievice_item_id"
    t.integer  "maker_id"
    t.string   "category"
    t.string   "jan_code"
    t.string   "house_jan_code"
    t.integer  "price"
    t.integer  "stock",                        default: 0
    t.integer  "ship_from_location", limit: 2, default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "makers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "person"
    t.string   "email"
    t.string   "tel"
    t.string   "tel_person"
    t.string   "condition"
    t.string   "payment_site"
    t.string   "closing_date"
    t.string   "bank_name"
    t.string   "branch_name"
    t.string   "bank_account_type"
    t.string   "bank_account_number"
    t.integer  "ship_from_location",  limit: 2,     default: 0
    t.text     "remarks",             limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "order_code"
    t.integer  "branch_no"
    t.integer  "chalievice_item_id"
    t.string   "item_name"
    t.string   "receiver_zip_code"
    t.string   "receiver_address"
    t.string   "receiver_name"
    t.string   "receiver_tel"
    t.string   "remarks"
    t.string   "delivery_company_code"
    t.string   "delivery_slip_code"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
