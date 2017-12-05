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

ActiveRecord::Schema.define(version: 20171205232204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.integer "localisation"
    t.integer "firm_type"
    t.integer "employees_count"
    t.integer "turnover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prospect_id"
    t.index ["prospect_id"], name: "index_companies_on_prospect_id"
  end

  create_table "dispositions", force: :cascade do |t|
    t.string "title"
    t.bigint "obligation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["obligation_id"], name: "index_dispositions_on_obligation_id"
  end

  create_table "obligations", force: :cascade do |t|
    t.string "title"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prospects", force: :cascade do |t|
    t.string "first_name"
    t.jsonb "address"
    t.string "phone_number"
    t.string "email"
    t.integer "role"
    t.boolean "is_responsible", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_obligation_dispositions", force: :cascade do |t|
    t.bigint "report_obligation_id"
    t.bigint "disposition_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disposition_id"], name: "index_report_obligation_dispositions_on_disposition_id"
    t.index ["report_obligation_id"], name: "index_report_obligation_dispositions_on_report_obligation_id"
  end

  create_table "report_obligations", force: :cascade do |t|
    t.bigint "report_id"
    t.bigint "obligation_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["obligation_id"], name: "index_report_obligations_on_obligation_id"
    t.index ["report_id"], name: "index_report_obligations_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.float "score"
    t.integer "result"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_reports_on_company_id"
  end

  add_foreign_key "dispositions", "obligations"
  add_foreign_key "report_obligation_dispositions", "dispositions"
  add_foreign_key "report_obligation_dispositions", "report_obligations"
  add_foreign_key "report_obligations", "obligations"
  add_foreign_key "report_obligations", "reports"
  add_foreign_key "reports", "companies"
end
