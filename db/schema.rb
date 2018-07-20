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

ActiveRecord::Schema.define(version: 2018_07_19_224553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calibrations", force: :cascade do |t|
    t.bigint "machine_id"
    t.integer "meter_number"
    t.integer "constant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_calibrations_on_machine_id"
  end

  create_table "loads", force: :cascade do |t|
    t.bigint "machine_id"
    t.integer "meter_number"
    t.bigint "product_id"
    t.integer "ounces"
    t.datetime "loaded_at"
    t.datetime "removed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_loads_on_machine_id"
    t.index ["product_id"], name: "index_loads_on_product_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "contact"
    t.string "contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_locations_on_owner_id"
  end

  create_table "machines", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "serial_number"
    t.string "version"
    t.integer "meter_count"
    t.string "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_machines_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
  end

  create_table "placements", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "machine_id"
    t.datetime "placed_at"
    t.datetime "removed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_placements_on_location_id"
    t.index ["machine_id"], name: "index_placements_on_machine_id"
  end

  create_table "pours", force: :cascade do |t|
    t.bigint "load_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_pours_on_load_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.string "brewer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticks", force: :cascade do |t|
    t.bigint "machine_id"
    t.integer "meter_number"
    t.bigint "pour_id"
    t.integer "count"
    t.datetime "reported_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_ticks_on_machine_id"
    t.index ["pour_id"], name: "index_ticks_on_pour_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "calibrations", "machines"
  add_foreign_key "loads", "machines"
  add_foreign_key "loads", "products"
  add_foreign_key "locations", "owners"
  add_foreign_key "machines", "owners"
  add_foreign_key "placements", "locations"
  add_foreign_key "placements", "machines"
  add_foreign_key "pours", "loads"
  add_foreign_key "ticks", "machines"
  add_foreign_key "ticks", "pours"
end
