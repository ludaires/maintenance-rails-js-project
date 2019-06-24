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

ActiveRecord::Schema.define(version: 2019_01_03_184904) do

  create_table "actions", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "code_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "code_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "location"
    t.string "calibration_unit"
    t.string "calibration_start"
    t.string "calibration_end"
    t.string "uncertainty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inspections", force: :cascade do |t|
    t.integer "maintenance_id"
    t.integer "part_id"
    t.integer "issue_id"
    t.integer "action_id"
    t.integer "cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_inspections_on_action_id"
    t.index ["cause_id"], name: "index_inspections_on_cause_id"
    t.index ["issue_id"], name: "index_inspections_on_issue_id"
    t.index ["maintenance_id"], name: "index_inspections_on_maintenance_id"
    t.index ["part_id"], name: "index_inspections_on_part_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "code_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer "user_id"
    t.integer "equipment_id"
    t.string "status"
    t.string "next_maintenance_date"
    t.text "notes"
    t.string "maintenance_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_maintenances_on_equipment_id"
    t.index ["user_id"], name: "index_maintenances_on_user_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "admin", default: false
    t.string "status", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
