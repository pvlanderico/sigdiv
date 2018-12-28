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

ActiveRecord::Schema.define(version: 2018_12_27_165515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "file"
    t.integer "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade do |t|
    t.string "name"
    t.float "base"
    t.string "formula"
    t.integer "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creditors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "financial_agent", default: false
  end

  create_table "debts", force: :cascade do |t|
    t.integer "code"
    t.bigint "contract_value_cents"
    t.date "signature_date"
    t.integer "creditor_id"
    t.date "grace_period"
    t.date "amortization_period"
    t.text "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amortization_type"
    t.integer "amortization_frequency"
    t.integer "financial_agent_id"
    t.string "applicable_legislation"
    t.integer "legislation_level"
    t.string "name"
    t.text "notes"
    t.integer "category"
    t.integer "currency"
  end

  create_table "withdraws", force: :cascade do |t|
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.date "date"
    t.integer "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
