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

ActiveRecord::Schema.define(version: 20161229080716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",     default: 0,  null: false
    t.datetime "locked_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "role",                default: 0
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  end

  create_table "batch_inputs", force: :cascade do |t|
    t.integer  "component_id"
    t.integer  "batch_id"
    t.decimal  "overage",      precision: 9, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["batch_id"], name: "index_batch_inputs_on_batch_id", using: :btree
    t.index ["component_id"], name: "index_batch_inputs_on_component_id", using: :btree
  end

  create_table "batches", force: :cascade do |t|
    t.integer  "combination_id"
    t.string   "code"
    t.integer  "size"
    t.decimal  "yield",           precision: 9, scale: 3
    t.date     "manufactured_on"
    t.date     "expiry_on"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["combination_id"], name: "index_batches_on_combination_id", using: :btree
  end

  create_table "combinations", force: :cascade do |t|
    t.string   "name"
    t.integer  "form",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.integer  "combination_id"
    t.integer  "raw_material_id"
    t.decimal  "volume",          precision: 9, scale: 3
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["combination_id"], name: "index_components_on_combination_id", using: :btree
    t.index ["raw_material_id"], name: "index_components_on_raw_material_id", using: :btree
  end

  create_table "product_batches", force: :cascade do |t|
    t.integer  "batch_id"
    t.integer  "product_id"
    t.decimal  "mrp",        precision: 6, scale: 2
    t.decimal  "input",      precision: 9, scale: 2
    t.integer  "output"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "size"
    t.index ["batch_id"], name: "index_product_batches_on_batch_id", using: :btree
    t.index ["product_id"], name: "index_product_batches_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "manufactured_by_id"
    t.integer  "marketed_by_id"
    t.integer  "combination_id"
    t.integer  "packaging_type"
    t.string   "size"
    t.string   "primany_packing"
    t.string   "secondary_packing"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["combination_id"], name: "index_products_on_combination_id", using: :btree
    t.index ["manufactured_by_id"], name: "index_products_on_manufactured_by_id", using: :btree
    t.index ["marketed_by_id"], name: "index_products_on_marketed_by_id", using: :btree
  end

  create_table "raw_material_batches", force: :cascade do |t|
    t.integer  "raw_material_id"
    t.integer  "vendor_id"
    t.decimal  "quantity",                 precision: 8, scale: 3
    t.decimal  "available_quantity_cache", precision: 8, scale: 3
    t.string   "batch_no"
    t.date     "manufactured_on"
    t.date     "expiry_on"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["raw_material_id"], name: "index_raw_material_batches_on_raw_material_id", using: :btree
    t.index ["vendor_id"], name: "index_raw_material_batches_on_vendor_id", using: :btree
  end

  create_table "raw_material_usages", force: :cascade do |t|
    t.integer  "raw_material_batch_id"
    t.string   "description"
    t.decimal  "quantity",              precision: 10, scale: 3
    t.date     "used_on"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "batch_input_id"
    t.index ["batch_input_id"], name: "index_raw_material_usages_on_batch_input_id", using: :btree
    t.index ["raw_material_batch_id"], name: "index_raw_material_usages_on_raw_material_batch_id", using: :btree
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string   "name"
    t.integer  "form"
    t.integer  "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "batch_inputs", "batches"
  add_foreign_key "batch_inputs", "components"
  add_foreign_key "batches", "combinations"
  add_foreign_key "components", "combinations"
  add_foreign_key "components", "raw_materials"
  add_foreign_key "product_batches", "batches"
  add_foreign_key "product_batches", "products"
  add_foreign_key "products", "combinations"
  add_foreign_key "products", "companies", column: "manufactured_by_id"
  add_foreign_key "products", "companies", column: "marketed_by_id"
  add_foreign_key "raw_material_batches", "raw_materials"
  add_foreign_key "raw_material_batches", "vendors"
  add_foreign_key "raw_material_usages", "batch_inputs"
  add_foreign_key "raw_material_usages", "raw_material_batches"
end
