# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150309030130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: :cascade do |t|
    t.integer  "divvy_id",   null: false
    t.string   "name",       null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "capacity"
    t.datetime "opened_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "divvy_id",             null: false
    t.integer  "departure_station_id", null: false
    t.datetime "departed_at",          null: false
    t.integer  "arrival_station_id",   null: false
    t.datetime "arrived_at",           null: false
    t.integer  "duration_in_seconds",  null: false
    t.string   "user_type"
    t.string   "gender"
    t.integer  "birth_year"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "trips", ["divvy_id"], name: "index_trips_on_divvy_id", using: :btree

end
