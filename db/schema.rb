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

ActiveRecord::Schema.define(version: 2018_05_07_203054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sub_departments_id"
    t.index ["sub_departments_id"], name: "index_brands_on_sub_departments_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "purchased_at"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_on_d_sd_bs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "sub_department_id"
    t.index ["brand_id"], name: "index_join_on_d_sd_bs_on_brand_id"
    t.index ["sub_department_id"], name: "index_join_on_d_sd_bs_on_sub_department_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "order_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "order_transactions", force: :cascade do |t|
    t.integer "order_id"
    t.string "action"
    t.integer "amount"
    t.boolean "success"
    t.string "authorization"
    t.string "message"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text "address"
    t.string "email"
    t.integer "pay_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.integer "cart_id"
    t.string "card_type"
    t.date "card_expires_on"
    t.string "ip_address"
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.text "description"
    t.bigint "department_id"
    t.bigint "sub_department_id"
    t.bigint "brand_id"
    t.string "display_name"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["department_id"], name: "index_products_on_department_id"
    t.index ["sub_department_id"], name: "index_products_on_sub_department_id"
  end

  create_table "sub_departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_sub_departments_on_department_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name"
    t.string "company_address"
    t.string "city"
    t.string "regin"
    t.string "country"
    t.string "postal_code"
    t.string "phone_number"
    t.string "email"
    t.binary "active"
    t.string "fax"
    t.string "website"
    t.decimal "ranking"
    t.binary "current_oder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.bit "is_admin", limit: 1
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "products_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["products_id"], name: "index_wishlists_on_products_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "brands", "sub_departments", column: "sub_departments_id"
  add_foreign_key "join_on_d_sd_bs", "brands"
  add_foreign_key "join_on_d_sd_bs", "sub_departments"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "departments"
  add_foreign_key "products", "sub_departments"
  add_foreign_key "sub_departments", "departments"
  add_foreign_key "wishlists", "products", column: "products_id"
  add_foreign_key "wishlists", "users"
end
