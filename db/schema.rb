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

ActiveRecord::Schema.define(version: 20160418202323) do

  create_table "buildings", force: :cascade do |t|
    t.string   "shortname",       null: false
    t.string   "name",            null: false
    t.string   "city"
    t.string   "street"
    t.integer  "user_id"
    t.integer  "dashboard_id"
    t.integer  "company_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "buildings", ["company_type_id"], name: "index_buildings_on_company_type_id"
  add_index "buildings", ["dashboard_id"], name: "index_buildings_on_dashboard_id"
  add_index "buildings", ["user_id"], name: "index_buildings_on_user_id"

  create_table "company_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "building_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "laboratories", ["building_id"], name: "index_laboratories_on_building_id"

  create_table "users", force: :cascade do |t|
    t.string   "visible_name",                                     null: false
    t.string   "email",                                            null: false
    t.string   "password_digest",                                  null: false
    t.datetime "last_login",       default: '2016-04-18 20:47:43', null: false
    t.string   "last_ip",          default: "0.0.0.0",             null: false
    t.boolean  "was_activated",    default: false
    t.boolean  "active",           default: true
    t.integer  "permission_level", default: 0,                     null: false
    t.string   "image_file",       default: "default.png",         null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "workstations", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "laboratory_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "workstations", ["laboratory_id"], name: "index_workstations_on_laboratory_id"

end
