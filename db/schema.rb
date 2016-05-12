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

ActiveRecord::Schema.define(version: 20160425203550) do

  create_table "active_widgets", force: :cascade do |t|
    t.integer  "dashboard_user_setting_id", null: false
    t.integer  "widget_id",                 null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "active_widgets", ["dashboard_user_setting_id"], name: "index_active_widgets_on_dashboard_user_setting_id"
  add_index "active_widgets", ["widget_id"], name: "index_active_widgets_on_widget_id"

  create_table "avatars", force: :cascade do |t|
    t.string   "url",        default: "default_avatar.png", null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "shortname",       null: false
    t.string   "name",            null: false
    t.string   "city"
    t.string   "street"
    t.integer  "user_id",         null: false
    t.integer  "dashboard_id",    null: false
    t.integer  "company_type_id", null: false
    t.integer  "country_id",      null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "buildings", ["company_type_id"], name: "index_buildings_on_company_type_id"
  add_index "buildings", ["country_id"], name: "index_buildings_on_country_id"
  add_index "buildings", ["dashboard_id"], name: "index_buildings_on_dashboard_id"
  add_index "buildings", ["user_id"], name: "index_buildings_on_user_id"

  create_table "company_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "code",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_assignments", force: :cascade do |t|
    t.integer  "dashboard_id",              null: false
    t.integer  "user_id",                   null: false
    t.integer  "dashboard_user_setting_id", null: false
    t.integer  "dashboard_role_id",         null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "dashboard_assignments", ["dashboard_id"], name: "index_dashboard_assignments_on_dashboard_id"
  add_index "dashboard_assignments", ["dashboard_role_id"], name: "index_dashboard_assignments_on_dashboard_role_id"
  add_index "dashboard_assignments", ["dashboard_user_setting_id"], name: "index_dashboard_assignments_on_dashboard_user_setting_id"
  add_index "dashboard_assignments", ["user_id"], name: "index_dashboard_assignments_on_user_id"

  create_table "dashboard_roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "rank",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_user_settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "rank",       null: false
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

  create_table "laboratories_assignments", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "laboratory_id", null: false
    t.integer  "lab_role_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "laboratories_assignments", ["lab_role_id"], name: "index_laboratories_assignments_on_lab_role_id"
  add_index "laboratories_assignments", ["laboratory_id"], name: "index_laboratories_assignments_on_laboratory_id"
  add_index "laboratories_assignments", ["user_id"], name: "index_laboratories_assignments_on_user_id"

  create_table "log_types", force: :cascade do |t|
    t.string  "name", null: false
    t.integer "rank", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.text     "log",                             null: false
    t.string   "category",    default: "unknown", null: false
    t.integer  "user_id"
    t.integer  "log_type_id",                     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "logs", ["log_type_id"], name: "index_logs_on_log_type_id"
  add_index "logs", ["user_id"], name: "index_logs_on_user_id"

  create_table "site_roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "rank",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "visible_name",                                    null: false
    t.string   "email",                                           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "age"
    t.string   "password_digest",                                 null: false
    t.datetime "last_login",      default: '2016-05-12 21:09:33', null: false
    t.string   "last_ip",         default: "0.0.0.0",             null: false
    t.boolean  "was_activated",   default: false,                 null: false
    t.boolean  "active",          default: true,                  null: false
    t.datetime "last_seen",       default: '2016-05-12 21:09:33', null: false
    t.integer  "site_role_id",                                    null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["site_role_id"], name: "index_users_on_site_role_id"

  create_table "users_avatars", force: :cascade do |t|
    t.boolean  "active",     default: false, null: false
    t.integer  "user_id",                    null: false
    t.integer  "avatar_id",                  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "users_avatars", ["avatar_id"], name: "index_users_avatars_on_avatar_id"
  add_index "users_avatars", ["user_id"], name: "index_users_avatars_on_user_id"

  create_table "widgets", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "widgetscol", default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "workstations", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "number",        default: 0, null: false
    t.integer  "laboratory_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "workstations", ["laboratory_id"], name: "index_workstations_on_laboratory_id"

end
