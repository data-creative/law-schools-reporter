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

ActiveRecord::Schema.define(version: 20170923030805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employment_reports", force: :cascade do |t|
    t.string "school_name", null: false
    t.integer "year", null: false
    t.integer "total_grads"
    t.integer "total_employed"
    t.text "employment_types"
    t.text "employment_statuses"
    t.text "employment_locations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_name", "year"], name: "index_employment_reports_on_school_name_and_year", unique: true
    t.index ["school_name"], name: "index_employment_reports_on_school_name"
    t.index ["year"], name: "index_employment_reports_on_year"
  end

  create_table "schools", force: :cascade do |t|
    t.integer "uuid", null: false
    t.string "long_name", null: false
    t.string "name", null: false
    t.integer "year_founded"
    t.string "url", null: false
    t.string "reports_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["long_name"], name: "index_schools_on_long_name", unique: true
    t.index ["name"], name: "index_schools_on_name", unique: true
    t.index ["url"], name: "index_schools_on_url", unique: true
    t.index ["uuid"], name: "index_schools_on_uuid", unique: true
  end

end
