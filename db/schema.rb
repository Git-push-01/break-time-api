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

ActiveRecord::Schema.define(version: 2019_05_17_230055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breaks", force: :cascade do |t|
    t.date "breakdate"
    t.string "breaketime"
    t.bigint "user_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "breakend"
    t.index ["employee_id"], name: "index_breaks_on_employee_id"
    t.index ["user_id"], name: "index_breaks_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "companyname"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "employeename"
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "managername"
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_managers_on_company_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "breaks", "employees"
  add_foreign_key "breaks", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "managers"
  add_foreign_key "employees", "users"
  add_foreign_key "managers", "companies"
  add_foreign_key "managers", "users"
end
